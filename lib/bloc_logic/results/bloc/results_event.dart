import 'package:cartoonate/helper/selectedImage.dart';
import 'package:cartoonate/pages/art.dart';
import 'package:flutter/material.dart';

abstract class ResultsEvent {}

class Generate extends ResultsEvent {}

class Upload extends ResultsEvent {}

class StartProcess extends ResultsEvent {
  SelectedImage selectedImage;
  ArtStylesOptions selectedArt;
  StartProcess(this.selectedImage, this.selectedArt);
}
