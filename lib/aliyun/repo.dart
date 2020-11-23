import 'package:cartoonate/helper/User.dart';
import 'package:flutter/material.dart';

class Repository {
  const Repository();

  User getUser() {
    //get image
    var url =
        'http://cartoonate.oss-ap-southeast-1.aliyuncs.com/profilePicture/4.png?Expires=1605926760';
    try {
      // var response = await http.get(url);
      // var imageId = await ImageDownloader.downloadImage(url);
      // var path = await ImageDownloader.findPath(imageId);
      var image = Image.network(url);
      // var image = NetworkImage(url);
      return User(username: 'admin', password: 'admin', profilePic: image);
    } catch (e) {
      return null;
    }
  }
}
