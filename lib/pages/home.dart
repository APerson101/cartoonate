import 'package:cartoonate/bloc_logic/results/bloc/results.dart';
import 'package:cartoonate/bloc_logic/upload_bloc/upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'picConfirmed.dart';
import 'results.dart';

class Home extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadBloc>(create: (context) => UploadBloc()),
      ],
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBloc, UploadState>(
      listener: (context, state) {
        if (state is PicConfirmed)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return ResultsPage(state.selectedImage);
            }),
          );
      },
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Container(
              color: Color(0xFF444444),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Expanded(child: Left()), Expanded(child: Right())],
              ),
            ));
      },
      buildWhen: (previous, current) {
        if (current is PicConfirmed) return false;
        return true;
      },
    );
  }
}

class Left extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF444444),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              'Select Image',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Flexible(flex: 3, child: Image.asset('assets/images/r.png')),
          Flexible(
            flex: 1,
            child: Text(
              'Select Headshot for best result. Format accepted are : .jpg and .png',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'max size is 2 MB',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Right extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBloc, UploadState>(
      listener: (context, state) {
        if (state is PicConfirmed)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return ResultsPage(state.selectedImage);
            }),
          );
      },
      builder: (context, state) {
        var image;
        Widget button;
        if (state is ImageSelected) {
          image = Image.memory(state.selectedImage.fileBytes);
          button = ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5.0,
                  child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(200, 50)),
                      child: RaisedButton(
                        child: Text('Change Image'),
                        color: Colors.blue,
                        onPressed: () {
                          BlocProvider.of<UploadBloc>(context)
                              .add(SelectPhoto());
                        },
                      ))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(200, 50)),
                    child: RaisedButton(
                      child: Text('Convert'),
                      color: Colors.green,
                      onPressed: () {
                        BlocProvider.of<UploadBloc>(context)
                            .add(UploadProceed());
                      },
                    ),
                  ))
            ],
          );
        }
        if (state is UploadInitial) {
          image = Image.asset('assets/video/Upload.gif');
          button = RaisedButton(
            onPressed: () {
              BlocProvider.of<UploadBloc>(context).add(SelectPhoto());
            },
            child: Text(
              'Upload',
              style: TextStyle(fontSize: 15),
            ),
            color: Colors.green,
          );
        }

        if (state is UploadLoading) {
          image = CircularProgressIndicator();
          button = RaisedButton(
            onPressed: () {
              null;
            },
          );
        }
        if (state is UploadFailed) {
          image = Image.asset('assets/images/anxiety.png');
          button = RaisedButton(
            onPressed: () {
              BlocProvider.of<UploadBloc>(context).add(SelectPhoto());
            },
            child: Text(
              'Change Picture',
              style: TextStyle(fontSize: 15),
            ),
            color: Colors.green,
          );
        }
        return Container(
          color: Color(0xadacaa),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: image,
              ),
              Flexible(
                flex: 1,
                child: button,
              )
            ],
          ),
        );
      },
      buildWhen: (previous, current) {
        if (current is PicConfirmed) return false;
        return true;
      },
    );
  }
}

class PicSelected extends StatelessWidget {
  final Image selectedImage;
  const PicSelected(this.selectedImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF444444),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Confirm Selected Image',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              child: SizedBox(
                width: 200,
                child: selectedImage,
              )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('change image'),
                color: Colors.greenAccent,
                onPressed: () {
                  BlocProvider.of<UploadBloc>(context).add(SelectPhoto());
                },
              ),
              RaisedButton(
                child: Text('Cartoonate'),
                color: Color(0x2069e0),
                onPressed: () {
                  BlocProvider.of<UploadBloc>(context).add(UploadProceed());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
