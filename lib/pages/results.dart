import 'dart:html';

import 'package:cartoonate/bloc_logic/results/bloc/results.dart';
import 'package:cartoonate/helper/selectedImage.dart';
import 'package:cartoonate/pages/art.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'resultsloaded.dart';

class ResultsPage extends StatelessWidget {
  final SelectedImage selectedImage;
  final ArtStylesOptions selectedArt;
  ResultsPage(this.selectedImage, this.selectedArt);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResultsBloc>(
      create: (context) {
        var r = ResultsBloc();
        r.add(StartProcess(selectedImage, this.selectedArt));
        return r;
      },
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Container(child: Progress())),
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResultsBloc, ResultsState>(listener: (context, state) {
      if (state is ResultsLoaded) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return ResultsLoadedPg(state.generatedImage);
          }),
        );
      }

      if (state is BadImageInput) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return ResultsLoadedPg(null);
          }),
        );
      }
    }, listenWhen: (previous, current) {
      return current is ResultsLoaded || current is BadImageInput;
    }, buildWhen: (previous, current) {
      return current is! ResultsLoaded;
    }, builder: (context, state) {
      print(state.toString());
      if (state is PicUploading) {
        return Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/video/uploading.gif',
                  fit: BoxFit.cover,
                )));
      }

      if (state is Generating) {
        return Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/video/generating.gif',
                  fit: BoxFit.cover,
                )));
      } else {
        return Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/video/loading.gif',
                  fit: BoxFit.cover,
                )));
      }
    });
  }
}
