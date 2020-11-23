import 'package:flutter/material.dart';

import 'picConfirmed.dart';

class VideoSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: ArtStylePage(
          null,
          video: true,
        ),
      ),
    );
  }
}

class VideoOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
