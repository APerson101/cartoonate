import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/helper/generatedImage.dart';
import 'package:cartoonate/helper/selectedImage.dart';
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
      yield PicUploading();
      var code = await uploadImage(selectedImage);
      if (code == 200) {
        yield PicUploadedSuccessfully();
        Future.delayed(Duration(milliseconds: 300));
        yield Generating();
        Response response = await cartoonify(selectedImage);
        print(response.statusCode);
        if (response.statusCode == 200) {
          yield GeneratedSuccessfully();
          var decode = jsonDecode(response.body);
          yield LoadingResult();
          var output_url = decode['output_url'];
          // await videoOutput(selectedImage, output_url);
          Future.delayed(Duration(milliseconds: 300));
          yield ResultsLoaded(GeneratedImage(output_url));
        } else if (response.statusCode == 400) {
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
    Response response = await put(url,
        headers: {'Content-type': 'image/jpeg'}, body: selectedImage.fileBytes);
    return response.statusCode;
  }

  cartoonify(SelectedImage selectedImage) async {
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
    String png = selectedImage.filename + '.png';
    'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/generated/$png';
    await put(png,
        headers: {'Content-type': 'image/png'}, body: selectedImage.fileBytes);
    return response;
  }

  videoOutput(SelectedImage selectedImage, String output_url) async {
    String filename = selectedImage.filename + '.png';
    String url = 'http://34.71.66.151:5000/post';
    String videoLink =
        'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/video/3.mp4';
    Response response =
        await post(url, body: {'image': output_url, 'video': videoLink});

    print('video testing: ${response.statusCode}');
    print(jsonDecode(response.body));
  }
}
