import 'package:cartoonate/helper/User.dart';
import 'package:flutter/material.dart';

class ImagePost {
  final dynamic originalpost;
  final dynamic generatedpost;
  final DateTime date;
  final User poster;
  final int likes;
  const ImagePost(
      {this.date,
      this.originalpost,
      this.generatedpost,
      this.likes,
      this.poster});
}
