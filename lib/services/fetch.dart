import 'dart:convert';

import 'package:api_learn/model/posts_model.dart';
import 'package:http/http.dart' as http;

class Fetchdata {
  Future<List<Post>?> getposts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List<dynamic>;
      return json.map((postjson) => Post.fromJson(postjson)).toList();
    } else {
      return null;
    }
  }
}
