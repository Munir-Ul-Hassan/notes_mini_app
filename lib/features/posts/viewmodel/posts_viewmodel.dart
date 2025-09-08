import 'package:flutter/material.dart';
import '../../../data/models/post.dart';
import '../../../data/repositories/posts_repository.dart';

enum PostsState { loading, loaded, error, empty }

class PostsViewModel extends ChangeNotifier {
  final PostsRepository _repository = PostsRepository();
  List<Post> _posts = [];
  PostsState _state = PostsState.loading;
  String? _error;
  int _page = 0;
  final int _limit = 10;
  bool _hasMore = true;

  List<Post> get posts => _posts;
  PostsState get state => _state;
  String? get error => _error;
  bool get hasMore => _hasMore;

  PostsViewModel() {
    fetchPosts();
  }

  Future<void> fetchPosts({bool loadMore = false}) async {
    if (loadMore && !_hasMore) return;
    _state = PostsState.loading;
    notifyListeners();
    try {
      final newPosts = await _repository.fetchPosts(start: _page * _limit, limit: _limit);
      if (loadMore) {
        _posts.addAll(newPosts);
      } else {
        _posts = newPosts;
      }
      _hasMore = newPosts.length == _limit;
      _state = _posts.isEmpty ? PostsState.empty : PostsState.loaded;
      _page += 1;
    } catch (e) {
      _error = e.toString();
      _state = PostsState.error;
    }
    notifyListeners();
  }

  void retry() {
    fetchPosts(loadMore: false);
  }
}