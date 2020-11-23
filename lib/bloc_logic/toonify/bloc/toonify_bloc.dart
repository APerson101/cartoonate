import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toonify_event.dart';
part 'toonify_state.dart';

class ToonifyBloc extends Bloc<ToonifyEvent, ToonifyState> {
  ToonifyBloc() : super(ToonifyInitial());

  @override
  Stream<ToonifyState> mapEventToState(
    ToonifyEvent event,
  ) async* {}
}
