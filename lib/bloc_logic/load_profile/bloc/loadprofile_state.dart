import 'package:cartoonate/helper/User.dart';
import 'package:flutter/material.dart';

abstract class LoadprofileState {}

class LoadprofileInitial extends LoadprofileState {}

class LogOut extends LoadprofileState {}

class LoadprofileSucess extends LoadprofileState {
  final User user;
  LoadprofileSucess(this.user);
}
