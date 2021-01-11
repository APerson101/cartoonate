part of 'artstyles_bloc.dart';

@immutable
abstract class ArtstylesState {}

class ArtstylesInitial extends ArtstylesState {}

class UploadSuccess extends ArtstylesState {}

class UploadFailure extends ArtstylesState {}

class Uploading extends ArtstylesState {}
