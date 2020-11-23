import 'dart:async';

import 'package:bloc/bloc.dart';

import '../imageLoading.dart';

class ImageloadingBloc extends Bloc<ImageloadingEvent, ImageloadingState> {
  ImageloadingBloc() : super(ImageloadingInitial());

  @override
  Stream<ImageloadingState> mapEventToState(
    ImageloadingEvent event,
  ) async* {
    if (event is LoadImage) {
      // yield ImageL
    }
  }
}
