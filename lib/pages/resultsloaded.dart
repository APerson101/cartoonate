import 'package:cartoonate/bloc_logic/upload_bloc/upload.dart';
import 'package:cartoonate/helper/generatedImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';
import 'picConfirmed.dart';

class ResultsLoadedPg extends StatelessWidget {
  final GeneratedImage generatedImage;
  ResultsLoadedPg(this.generatedImage);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UploadBloc>(create: (context) => UploadBloc())
        ],
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Center(child: Results(generatedImage)),
          ),
        ));
  }
}

class Results extends StatelessWidget {
  final GeneratedImage generatedImage;
  Results(this.generatedImage);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBloc, UploadState>(listener: (context, state) {
      if (state is ImageSelected) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return ArtStylePage(
              state.selectedImage,
            );
          }),
        );
      }
    }, builder: (context, state) {
      return Container(
        color: Color(0xFF444444),
        child: generatedImage == null
            ? BadImage()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Image.network(generatedImage.url),
                      ),
                      Flexible(
                          flex: 1,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                              child: ConstrainedBox(
                                  constraints:
                                      BoxConstraints.tight(const Size(200, 50)),
                                  child: RaisedButton(
                                    child: Text(
                                      "Again!!",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<UploadBloc>(context)
                                          .add(SelectPhoto());
                                    },
                                  ))))
                    ],
                  )),
                  Column(
                    children: [
                      Container(
                        color: Colors.green,
                      ),
                      Text('donwload, share, change video'),
                      RaisedButton(
                        child: Text("change video"),
                        onPressed: () {
                          BlocProvider.of<UploadBloc>(context)
                              .add(SelectVideo());
                        },
                      )
                    ],
                  )
                ],
              ),
      );
    });
  }
}

class BadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Image.asset('assets/video/badimage.gif'),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Bad Image Selected, try again!',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Flexible(
            flex: 1,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 5.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(200, 50)),
                  child: RaisedButton(
                      child: Text('Change'),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      }),
                )),
          )
        ],
      ),
    );
  }
}
