import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF444444),
      child: Center(
        child: Text(
          'history',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
