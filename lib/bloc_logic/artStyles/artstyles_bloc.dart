import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/helper/selectedImage.dart';
import 'package:meta/meta.dart';

part 'artstyles_event.dart';
part 'artstyles_state.dart';

class ArtstylesBloc extends Bloc<ArtstylesEvent, ArtstylesState> {
  ArtstylesBloc() : super(ArtstylesInitial());

  @override
  Stream<ArtstylesState> mapEventToState(
    ArtstylesEvent event,
  ) async* {
    if (event is UploadPicEvent) {
      uploadPics();
    }
  }

  uploadPics() async* {
    yield Uploading();
  }
}
