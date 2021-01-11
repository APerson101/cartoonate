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
        child: SafeArea(
          child: Center(
            child: Text(
              'HOME PAGE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
        // child: Center(
        //     child: ListView(
        //   children: [
        //     Padding(
        //         padding:
        //             EdgeInsets.only(left: 20, right: 20, bottom: 80, top: 20),
        //         child: Text(
        //           'Cartoonate is an app that enables users to have fun and be creative by allowing them to animate pics and video that would otherwise have taken a very long time to accomplish, this is achieved through the use of machine learning.\n' +
        //               'more features would be added and users would be able to' +
        //               'select different types of animation style and cartoon characters. The app relies heavily on Alibaba Products which includes: \n\nPlatform for AI\n\nObject Storage Services\n\nNAS\n\nHosting\n\nDNS\n\nECS.' +
        //               '\n\n'
        //                   'The social media page shows the result of what other people have tried using my system',
        //           style: TextStyle(fontSize: 20, color: Colors.white),
        //         ))
        //   ],
        // )),
        );
  }
}
