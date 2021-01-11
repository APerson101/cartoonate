// import 'package:cartoonate/bloc_logic/results/bloc/results.dart';
// import 'package:cartoonate/bloc_logic/results/bloc/results_bloc.dart';
// import 'package:cartoonate/helper/selectedImage.dart';
// import 'package:cartoonate/pages/videoselection.dart';
// import 'package:custom_radio/custom_radio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'results.dart';

// class ArtStylePage extends StatefulWidget {
//   final SelectedImage selectedImage;
//   bool video;
//   ArtStylePage(
//     this.selectedImage, {
//     Key key,
//     this.video = false,
//   }) : super(key: key);

//   @override
//   _ArtStylePageState createState() => _ArtStylePageState(video, selectedImage);
// }

// class _ArtStylePageState extends State<ArtStylePage> {
//   _ArtStylePageState(this.video, this.selectedImage);
//   final SelectedImage selectedImage;
//   bool video = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ResultsBloc>(
//         create: (context) => ResultsBloc(),
//         child: Scaffold(
//             body: _Home(
//           selectedImage,
//           video: video,
//         )));
//   }
// }

// class _Home extends StatelessWidget {
//   _Home(this.selectedImage, {this.video = false});
//   final SelectedImage selectedImage;
//   final bool video;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.only(bottom: 100),
//         color: Color(0xFF444444),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Select Art Style'),
//               // SizedBox(height: 20),
//               video ? videoSelection() : ArtSelection(),
//               // SizedBox(height: 20),
//               RaisedButton(
//                   child: Text('Cartoonate'),
//                   onPressed: () {
//                     BlocProvider.of<ResultsBloc>(context).add(Generate());
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return ResultsPage(selectedImage);
//                     }));
//                   })
//             ]));
//   }
// }

// class ArtSelection extends StatefulWidget {
//   @override
//   _ArtSelectionState createState() => _ArtSelectionState();
//   int radioValue = 0;
// }

// class _ArtSelectionState extends State<ArtSelection>
//     with SingleTickerProviderStateMixin {
//   _ArtSelectionState() {
//     dynamicBuilder = (BuildContext context, List<dynamic> animValues,
//         Function updateState, int value) {
//       return GestureDetector(
//           onTap: () {
//             setState(() {
//               widget.radioValue = value;
//             });
//           },
//           child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
//               padding: EdgeInsets.all(32.0 + animValues[0] * 12.0),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: animValues[1],
//                   border: Border.all(color: animValues[2], width: 2.0)),
//               child: Text(
//                 value.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyText1
//                     .copyWith(fontSize: 20.0, color: animValues[2]),
//               )));
//     };
//   }

//   AnimationController _controller;
//   Animation<double> _animation;
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(duration: Duration(milliseconds: 100), vsync: this);
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
//     _controller.addListener(() {
//       setState(() {});
//     });
//   }

//   RadioBuilder<int, dynamic> dynamicBuilder;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('the width is: ' + MediaQuery.of(context).size.width.toString());
//     print('the height is: ' + MediaQuery.of(context).size.width.toString());
//     return Expanded(
//       child: Container(
//         child: GridView.count(
//           shrinkWrap: true,
//           childAspectRatio: 1,
//           crossAxisCount: 3,
//           // crossAxisSpacing: 15,
//           padding: const EdgeInsets.only(left: 50, right: 50),
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
//               child: CustomRadio<int, dynamic>(
//                 builder: dynamicBuilder,
//                 value: 0,
//                 groupValue: widget.radioValue,
//                 animsBuilder: (AnimationController controller) => [
//                   CurvedAnimation(parent: controller, curve: Curves.easeInOut),
//                   ColorTween(begin: Colors.white, end: Colors.deepPurple)
//                       .animate(controller),
//                   ColorTween(begin: Colors.deepPurple, end: Colors.white)
//                       .animate(controller),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
//               child: CustomRadio<int, dynamic>(
//                 builder: dynamicBuilder,
//                 value: 1,
//                 groupValue: widget.radioValue,
//                 animsBuilder: (AnimationController controller) => [
//                   CurvedAnimation(parent: controller, curve: Curves.easeInOut),
//                   ColorTween(begin: Colors.white, end: Colors.deepPurple)
//                       .animate(controller),
//                   ColorTween(begin: Colors.deepPurple, end: Colors.white)
//                       .animate(controller),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
//               child: CustomRadio<int, dynamic>(
//                 builder: dynamicBuilder,
//                 value: 2,
//                 groupValue: widget.radioValue,
//                 animsBuilder: (AnimationController controller) => [
//                   CurvedAnimation(parent: controller, curve: Curves.easeInOut),
//                   ColorTween(begin: Colors.white, end: Colors.deepPurple)
//                       .animate(controller),
//                   ColorTween(begin: Colors.deepPurple, end: Colors.white)
//                       .animate(controller),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
