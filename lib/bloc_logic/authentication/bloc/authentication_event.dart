import 'package:flutter/widgets.dart';

@immutable
abstract class AuthenticationEvent {}

class RequestAuthentication extends AuthenticationEvent {}
