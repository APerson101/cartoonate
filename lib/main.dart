import 'package:cartoonate/pages/picConfirmed.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';
import 'pages/mainApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
//home:Login()
      // home: ArtStylePage(null)
    );
  }
}
