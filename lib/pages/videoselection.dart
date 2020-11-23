import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';

class videoSelection extends StatefulWidget {
  @override
  _videoSelectionState createState() => _videoSelectionState();
  int radioValue = 0;
}

class _videoSelectionState extends State<videoSelection>
    with SingleTickerProviderStateMixin {
  _videoSelectionState() {
    dynamicBuilder = (BuildContext context, List<dynamic> animValues,
        Function updateState, int value) {
      return GestureDetector(
          onTap: () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
              padding: EdgeInsets.all(32.0 + animValues[0] * 12.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: animValues[1],
                  border: Border.all(color: animValues[2], width: 2.0)),
              child: Text(
                value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 20.0, color: animValues[2]),
              )));
    };
  }

  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.addListener(() {
      setState(() {});
    });
  }

  RadioBuilder<int, dynamic> dynamicBuilder;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: 1,
          crossAxisCount: 3,
          // crossAxisSpacing: 15,
          padding: const EdgeInsets.only(left: 50, right: 50),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
              child: CustomRadio<int, dynamic>(
                builder: dynamicBuilder,
                value: 0,
                groupValue: widget.radioValue,
                animsBuilder: (AnimationController controller) => [
                  CurvedAnimation(parent: controller, curve: Curves.easeInOut),
                  ColorTween(begin: Colors.white, end: Colors.deepPurple)
                      .animate(controller),
                  ColorTween(begin: Colors.deepPurple, end: Colors.white)
                      .animate(controller),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
              child: CustomRadio<int, dynamic>(
                builder: dynamicBuilder,
                value: 1,
                groupValue: widget.radioValue,
                animsBuilder: (AnimationController controller) => [
                  CurvedAnimation(parent: controller, curve: Curves.easeInOut),
                  ColorTween(begin: Colors.white, end: Colors.deepPurple)
                      .animate(controller),
                  ColorTween(begin: Colors.deepPurple, end: Colors.white)
                      .animate(controller),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
              child: CustomRadio<int, dynamic>(
                builder: dynamicBuilder,
                value: 2,
                groupValue: widget.radioValue,
                animsBuilder: (AnimationController controller) => [
                  CurvedAnimation(parent: controller, curve: Curves.easeInOut),
                  ColorTween(begin: Colors.white, end: Colors.deepPurple)
                      .animate(controller),
                  ColorTween(begin: Colors.deepPurple, end: Colors.white)
                      .animate(controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
