import 'package:cartoonate/helper/generatedImage.dart';

abstract class ResultsState {}

class PicUploading extends ResultsState {}

class PicUploadedSuccessfully extends ResultsState {}

class Generating extends ResultsState {}

class GeneratedSuccessfully extends ResultsState {}

class LoadingResult extends ResultsState {}

class ResultsLoaded extends ResultsState {
  GeneratedImage generatedImage;
  ResultsLoaded(this.generatedImage);
}

class BadImageInput extends ResultsState {}

class Failure extends ResultsState {}
