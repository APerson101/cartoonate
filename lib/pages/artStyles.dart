import 'package:flutter/material.dart';

class ArtStyles extends StatelessWidget {
  ArtStyles();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: ButtonBar(
            children: [
              RaisedButton(
                child: Text('zombie'),
                onPressed: () {
                  buttonPressed(1);
                },
              ),
              RaisedButton(
                child: Text('Emoji'),
                onPressed: () {
                  buttonPressed(2);
                },
              ),
              RaisedButton(
                child: Text('Halloween'),
                onPressed: () {
                  buttonPressed(3);
                },
              ),
              RaisedButton(
                child: Text('Disney'),
                onPressed: () {
                  buttonPressed(4);
                },
              ),
              RaisedButton(
                child: Text('DisneyPlus'),
                onPressed: () {
                  buttonPressed(5);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  buttonPressed(int number) {
    switch (number) {
      case 1:
        break;
      default:
    }
  }
}
