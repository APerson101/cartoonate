import 'package:cartoonate/pages/art.dart';

abstract class UploadEvent {}

class SelectPhoto extends UploadEvent {}

class UploadProceed extends UploadEvent {
  UploadProceed(this.selectedArt);
  ArtStylesOptions selectedArt;
}

class SelectVideo extends UploadEvent {}

class SelectArtStyle extends UploadEvent {}
