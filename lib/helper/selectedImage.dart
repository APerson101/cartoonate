import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';

class SelectedImage {
  html.File cloudFile;
  String filename;
  Uint8List fileBytes;
  Image imageWidget;
  SelectedImage(this.fileBytes, this.imageWidget, this.filename,
      {this.cloudFile});
}
