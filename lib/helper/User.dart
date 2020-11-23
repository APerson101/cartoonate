import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  String username;
  String password;
  Image profilePic;
  User({
    this.username,
    this.password,
    this.profilePic,
  });

  User copyWith({
    String username,
    String password,
    Image profilePic,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'profilePic': profilePic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      username: map['username'],
      password: map['password'],
      profilePic: map['profilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(username: $username, password: $password, profilePic: $profilePic)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.username == username &&
        o.password == password &&
        o.profilePic == profilePic;
  }

  @override
  int get hashCode =>
      username.hashCode ^ password.hashCode ^ profilePic.hashCode;
}
