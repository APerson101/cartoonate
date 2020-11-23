import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mainApp.dart';

class Login extends StatelessWidget {
  const Login();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[40],
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            color: Colors.black38,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                  // child: Center(
                  child: Image.asset('assets/video/Welcome.gif',
                      // 'https://cartoonate.oss-ap-southeast-1.aliyuncs.com/welcomegif/Welcome.gif',
                      fit: BoxFit.cover),
                  // ),
                  // color: Colors.blueAccent,
                )),
                Expanded(child: LoginForm()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
              ),
            )),
            SizedBox(
              width: 15,
            ),
            Container(
                child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(200, 50)),
                    child: Center(
                        child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          hintText: 'Username',
                          suffixIcon: Icon(Icons.person)),
                    ))))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
              ),
            )),
            SizedBox(
              width: 15,
            ),
            Container(
                child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(200, 50)),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          hintText: 'Password',
                          suffixIcon: Icon(FontAwesomeIcons.lock)),
                    ))),
          ],
        ),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 5.0,
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(200, 50)),
              child: RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                color: Colors.blue[700],
                onPressed: () {
                  if (_passwordController.text == 'softai' &&
                      _usernameController.text == 'softai') {
                    Navigator.of(context).pushAndRemoveUntil(
                        // MaterialPageRoute(builder: (context) {
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  MainApp(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                        (route) => false);
                    print('success');
                  } else {
                    setState(() {
                      _passwordController.text = '';
                      _usernameController.text = '';
                    });
                  }
                },
              ),
            ))
      ]),
    );
  }
}
