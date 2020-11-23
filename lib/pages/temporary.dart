// import 'package:chips_choice/chips_choice.dart';
// import 'package:flutter/material.dart';

// class ArtStylePage extends StatefulWidget {
//   final Image selectedImage;
//   ArtStylePage(this.selectedImage, {Key key}) : super(key: key);

//   @override
//   _ArtStylePageState createState() => _ArtStylePageState(selectedImage);
// }

// class _ArtStylePageState extends State<ArtStylePage> {
//   _ArtStylePageState(this.selectedImage);
//   final Image selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: _Home(selectedImage));
//   }
// }

// class _Home extends StatelessWidget {
//   _Home(this.selectedImage);
//   final Image selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         alignment: Alignment.center,
//         color: Colors.yellowAccent,
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Select Art Style'),
//               SizedBox(height: 20),
//               ArtSelection(),
//               SizedBox(height: 20),
//               RaisedButton(
//                   child: Text('Cartoonate'),
//                   onPressed: () => print('button pressed'))
//             ]));
//   }
// }

// class ArtSelection extends StatefulWidget {
//   @override
//   _ArtSelectionState createState() => _ArtSelectionState();
// }

// class _ArtSelectionState extends State<ArtSelection> {
//   List<String> artselections = [
//     'disney',
//     'Archer',
//     'Family Guy',
//     'Paper',
//     'The Simpsons',
//     'Sixth One'
//   ];
//   List<Widget> testers = [
//     Container(color: Colors.red, height: 60, width: 60),
//     Container(color: Colors.red, height: 60, width: 60),
//     Container(color: Colors.red, height: 60, width: 60),
//     Container(color: Colors.red, height: 60, width: 60),
//     Container(color: Colors.red, height: 60, width: 60),
//     Container(color: Colors.red, height: 60, width: 60),
//   ];
//   List<Widget> tester = [];
//   @override
//   Widget build(BuildContext context) {
//     return ChipsChoice.multiple(
//         value: tester,
//         onChanged: (val) {},
//         choiceItems: C2Choice.listFrom<String, String>(
//             source: artselections, value: (i, v) => v, label: (i, v) => v));
//   }

//   List<C2Choice<dynamic>> characterDisplay() {}
// }

// class CharacterBox extends StatelessWidget {
//   const CharacterBox();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: const Color.fromRGBO(69, 69, 82, 1),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CharacterDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// Padding(
//               padding: const EdgeInsets.only(top: 60, left: 80, right: 80),
//               child: CustomRadio<int, dynamic>(
//                 builder: (BuildContext context, List<dynamic> animValues,
//                     Function updateState, int value) {
//                   return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           widget.radioValue = value;
//                         });
//                       },
//                       child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             // color: const Color.fromRGBO(69, 69, 82, 1),
//                             boxShadow: [
//                               BoxShadow(
//                                 // color: Colors.black.withOpacity(0.03),
//                                 blurRadius: 10,
//                               ),
//                             ],
//                           ),
//                           child: Text(
//                             value.toString(),
//                           )));
//                 },
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

// import 'dart:async';
// import 'dart:convert';
// import 'dart:html';
// import 'dart:typed_data';

// import 'package:bloc/bloc.dart';
// import 'package:cartoonate/helper/selectedImage.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:http_parser/http_parser.dart';

// import 'results.dart';
// import 'package:http/http.dart' as http;

// class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
//   ResultsBloc() : super(PicUploading());

//   @override
//   Stream<ResultsState> mapEventToState(
//     ResultsEvent event,
//   ) async* {
//     if (event is testuploading) {
//       yield PicUploading();
//       Future.delayed(Duration(seconds: 3));
//     }

//     if (event is testUploadsuccess) {
//       yield GeneratedSuccessfully();
//     }
//     if (event is Generate) {
//       yield Generating();
//       Future.delayed(Duration(seconds: 3));
//     }
//     if (event is testGeneratedSuccessfully) {
//       yield GeneratedSuccessfully();
//     }
//     if (event is testLoadingResult) {
//       yield LoadingResult();
//       Future.delayed(Duration(seconds: 3));
//     }
//     if (event is testResultsLoaded) {
//       yield ResultsLoaded();
//       Future.delayed(Duration(seconds: 1));
//     }

//     if (event is StartProcess) {
//       print('we got here at least');
//       await uploadImage(event.selectedImage);
//       // await Cartoonify();
//       // await UploadResult();
//       //done
//     }
//   }

//   uploadImage(SelectedImage selectedImage) async {
//     //url, header, body, encoding
//     Uint8List file;
//     final reader = FileReader();
//     reader.readAsDataUrl(selectedImage.cloudFile
//         .slice(0, selectedImage.cloudFile.size, selectedImage.cloudFile.type));
//     reader.onLoadEnd.listen((event) {
//       Uint8List data =
//           Base64Decoder().convert(reader.result.toString().split(",").last);
//       file = data;
//     }).onData((data) {
//       file = Base64Decoder().convert(reader.result.toString().split(",").last);
//       // return file;
//     });
//     while (file == null) {
//       await new Future.delayed(const Duration(milliseconds: 1));
//       if (file != null) {
//         break;
//       }
//     }
//     String fn = selectedImage.cloudFile.name;
//     String url =
//         'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/original/$fn';

//     Uri uri = Uri.parse(url);
//     Response response = await put(url,
//         headers: {'Content-type': 'image/jpeg'}, body: selectedImage.fileBytes);
//     // var request = http.MultipartRequest('PUT', uri);
//     // request.files.add(http.MultipartFile.fromBytes('image', file,
//     //     filename: selectedImage.cloudFile.name,
//     //     contentType: MediaType('image', 'jpeg')));
//     // print(selectedImage.cloudFile.name);
//     // var res = await request.send();

//     // print(res.statusCode);
//   }
// }
