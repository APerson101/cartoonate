import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/bloc_logic/authentication/bloc/auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Unauthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {}
}
