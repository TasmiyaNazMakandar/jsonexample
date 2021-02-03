

import 'dart:convert';

import 'package:appnetwork/model/post.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/users";

  Future<List<Post>> getPosts() async {

    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),)
          .toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
