import 'package:cartoonate/helper/ImagePost.dart';
import 'package:flutter/material.dart';

abstract class SocialmediaState {}

class SocialmediaInitial extends SocialmediaState {}

class PostsLoaded extends SocialmediaState {
  final List<ImagePost> posts;
  PostsLoaded(this.posts);
}

class PostLoading extends SocialmediaState {}

class PostLoadFailure extends SocialmediaState {}
