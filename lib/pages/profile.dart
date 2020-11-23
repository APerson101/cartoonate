import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF444444),
      child: Center(
        child: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
