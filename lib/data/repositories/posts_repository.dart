import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostsRepository {
  Future<List<Post>> fetchPosts({int start = 0, int limit = 10}) async {
    final response = await http.get(
        Uri.parse(
            'https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit'),
        headers: {"Access-Control-Allow-Origin": "*"});
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}