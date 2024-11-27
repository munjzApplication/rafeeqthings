import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_operations/model/post_mode.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Postmodel>> fetchPostList() async {
    try {
      String uri = "https://jsonplaceholder.typicode.com/comments";
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) => Postmodel(
              postId: e['postId'] as int,
              id: e['id'],
              name: e['name'] as String,
              email: e['email']as String,
              body: e['body']as String,

        )).toList();
      }
    } on SocketException {
      throw Exception("Something went wrong");
    } on TimeoutException {
      throw Exception("Something went wrong");
    }
   
    throw Exception("Something went wrong");
  }
}
