import 'dart:typed_data';

import 'package:cartoonate/helper/selectedImage.dart';
import 'package:cartoonate/pages/art.dart';
import 'package:flutter/material.dart';

abstract class UploadState {}

class UploadInitial extends UploadState {}

class UploadLoaded extends UploadState {}

class UploadLoading extends UploadState {}

class SelectArt extends UploadState {}

class ImageSelected extends UploadState {
  final SelectedImage selectedImage;

  ImageSelected(this.selectedImage);
}

class UploadFailed extends UploadState {}

class PicConfirmed extends UploadState {
  ArtStylesOptions selectedArtStyle;
  final SelectedImage selectedImage;

  PicConfirmed(this.selectedImage, this.selectedArtStyle);
}

class VideoSelected extends UploadState {
  final Uint8List videoselected;
  VideoSelected(this.videoselected);
}
