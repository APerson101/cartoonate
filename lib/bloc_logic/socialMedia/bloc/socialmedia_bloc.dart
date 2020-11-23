import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cartoonate/helper/ImagePost.dart';
import 'package:cartoonate/helper/User.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'socialmedia.dart';
import 'package:http/http.dart' as http;

class SocialmediaBloc extends Bloc<SocialmediaEvent, SocialmediaState> {
  SocialmediaBloc() : super(SocialmediaInitial());

  @override
  Stream<SocialmediaState> mapEventToState(
    SocialmediaEvent event,
  ) async* {
    if (event is LoadFeed) {
      yield PostLoading();
      var posts = await loadPics();
      yield PostsLoaded(posts);
    }
  }

  Future<List<ImagePost>> loadPics() async {
    List<String> fakeUsernames = [
      'binHashim',
      'admin',
      'nabs',
      'ayeola',
      'suue3',
      'presh_boy',
      'hausa_alausa',
      'abdul'
    ];
    List<ImagePost> posts = [];
    String original, generated, profilePic;
    for (int i = 1; i < 12; i++) {
      var likes = Random();
      var number = likes.nextInt(7);
      original =
          'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/original/$i.jpg';
      generated =
          'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/generated/$i.jpg';
      profilePic =
          'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/profilePicture/$number.png';
      try {
        var img_ori = Image.network(original, fit: BoxFit.fill);
        var img_gen = Image.network(generated, fit: BoxFit.cover);
        var img_pro = Image.network(profilePic, fit: BoxFit.cover);

        posts.add(ImagePost(
            originalpost: original,
            generatedpost: generated,
            likes: likes.nextInt(27),
            poster:
                User(username: fakeUsernames[number], profilePic: img_pro)));
      } catch (e) {
        print(e);
        return null;
      }
    }

    return posts;
  }
}
