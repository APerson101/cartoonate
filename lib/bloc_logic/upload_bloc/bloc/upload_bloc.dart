import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/helper/selectedImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web_redux/image_picker_web_redux.dart';
import 'package:random_string/random_string.dart';

import '../upload.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc() : super(UploadInitial());

  @override
  Stream<UploadState> mapEventToState(
    UploadEvent event,
  ) async* {
    if (event is SelectPhoto) {
      yield* _startImagePicker();
    }

    if (event is UploadProceed) {
      if (pickedImage != null)
        yield PicConfirmed(pickedImage, event.selectedArt);
    }

    if (event is SelectVideo) {
      yield* _selectVideo();
    }

    if (event is SelectArtStyle) {
      yield SelectArt();
    }
  }

  SelectedImage pickedImage;
  Stream<UploadState> _startImagePicker() async* {
    // Uint8List _fileBytes =
    //     await ImagePickerWeb.getImage(outputType: ImageType.bytes);

    // fromPicker.image.
    try {
      yield UploadLoading();
      var mediaData = await ImagePickerWeb.getImageInfo;

      String mimeType = mime(Path.basename(mediaData.fileName));
      html.File mediaFile =
          new html.File(mediaData.data, mediaData.fileName, {'type': mimeType});
      html.File _cloudFile;
      Uint8List _fileBytes;
      Image _imageWidget;
      if (mediaFile != null) {
        _cloudFile = mediaFile;
        _fileBytes = mediaData.data;
        // _imageWidget = Image.memory(mediaData.data);
        pickedImage = SelectedImage(
            _fileBytes, _imageWidget, randomAlphaNumeric(10),
            cloudFile: _cloudFile);
        yield ImageSelected(pickedImage);
      }
    } catch (e) {
      yield UploadFailed();
    }
  }

  Stream<UploadState> _selectVideo() async* {
    Uint8List videoData =
        await ImagePickerWeb.getVideo(outputType: VideoType.bytes);
    if (videoData != null) {
      yield VideoSelected(videoData);
    } else
      yield UploadFailed();
  }
}
