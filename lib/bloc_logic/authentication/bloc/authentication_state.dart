import 'package:flutter/widgets.dart';

@immutable
abstract class AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {}
