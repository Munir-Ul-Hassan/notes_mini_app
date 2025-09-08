import 'package:flutter/material.dart';
import '../../../data/models/post.dart';

class PostCard extends StatelessWidget {
  final Post? post;
  const PostCard({super.key, this.post});

  const PostCard.skeleton({super.key}) : post = null;

  @override
  Widget build(BuildContext context) {
    if (post == null) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Container(height: 20, color: Colors.grey[300]),
          subtitle: Container(height: 16, color: Colors.grey[200]),
        ),
      );
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(post!.title),
        subtitle: Text(post!.body, maxLines: 2, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}