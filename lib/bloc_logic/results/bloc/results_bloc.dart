import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:async/async.dart';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/helper/generatedImage.dart';
import 'package:cartoonate/helper/selectedImage.dart';
import 'package:cartoonate/pages/art.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'results.dart';
import 'package:http/http.dart' as http;

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  ResultsBloc() : super(PicUploading());

  @override
  Stream<ResultsState> mapEventToState(
    ResultsEvent event,
  ) async* {
    if (event is StartProcess) {
      SelectedImage selectedImage = event.selectedImage;
      ArtStylesOptions selectedArt = event.selectedArt;
      yield PicUploading();
      var code = await uploadImage(selectedImage);
      if (code == 200) {
        // yield PicUploadedSuccessfully();
        Future.delayed(Duration(milliseconds: 300));
        // yield Generating();
        Response response = await cartoonify(selectedImage, selectedArt);
        print('${response.statusCode} for cartoonify');
        if (response.statusCode == 200) {
          // yield GeneratedSuccessfully();
          var decode = jsonDecode(response.body);
          // yield LoadingResult();
          var output_url = decode['output_url'];
          // await videoOutput(selectedImage, output_url);
          // Future.delayed(Duration(milliseconds: 300));
          yield ResultsLoaded(GeneratedImage(output_url));
        } else if (response.statusCode == 422) {
          yield BadImageInput();
        }
      } else
        yield Failure();
    }
  }

  uploadImage(SelectedImage selectedImage) async {
    String fn = selectedImage.filename + '.jpg';
    print(fn);
    // headers: {'Content-type': 'image/jpeg'},
    String url =
        'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/original/$fn';
    var response = await put(url,
        headers: {'Content-type': 'image/jpeg'}, body: selectedImage.fileBytes);
    return response.statusCode;
  }

  cartoonify(SelectedImage selectedImage, ArtStylesOptions artStlye) async {
    String url = 'https://api.deepai.org/api/toonify';
    String filename = selectedImage.filename + '.jpg';
    print(filename);
    var headers = {'api-key': '8fab1cf8-bee5-48fe-adf9-0687cd7d928e'};
    Response response = await post(
      url,
      headers: headers,
      body: {
        'image':
            'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/original/$filename'
      },
    );
    return response;
  }

  videoOutput(SelectedImage selectedImage, output_url) async {
    String filename = selectedImage.filename + '.jpg';
    var bytes = selectedImage.fileBytes.toList();
    Random num = Random();
    int number = num.nextInt(8);
    String videoName = number.toString() + '.mp4';

    var videoURL =
        'https://cartoonate.oss-ap-southeast-1.aliyuncs.com/video/$videoName';
    var imageURL =
        'https://cartoonate.oss-ap-southeast-1.aliyuncs.com/original/$filename';
    // print(videoURL);
    //method 1
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://35.188.33.97:5000/post'));
    request.fields.addAll({'image': imageURL, 'video': videoURL});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('omo e no burst ohhhh');
    } else {
      print(response.reasonPhrase);
    }
//method 2
    // String url = 'http://34.72.79.33:5000/post';
    // Response response = await post(
    //   url,
    //   body: {'image': imageURL, 'video': videoURL},
    // );
    return response;
  }
}
