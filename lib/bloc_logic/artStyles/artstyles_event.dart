part of 'artstyles_bloc.dart';

@immutable
abstract class ArtstylesEvent {}

class UploadPicEvent extends ArtstylesEvent {
  final SelectedImage image;
  UploadPicEvent(this.image);
}
