import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/posts_viewmodel.dart';
import '../widgets/post_card.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Consumer<PostsViewModel>(
        builder: (context, vm, _) {
        if (vm.state == PostsState.loading) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (_, __) => const PostCard.skeleton(),
          );
        }
        if (vm.state == PostsState.error) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error: ${vm.error}'),
                ElevatedButton(
                  onPressed: vm.retry,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        if (vm.state == PostsState.empty) {
          return const Center(child: Text('No posts found.'));
        }
        return ListView.builder(
          itemCount: vm.posts.length + (vm.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < vm.posts.length) {
              final post = vm.posts[index];
              return PostCard(post: post);
            } else {
              // Load more button
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => vm.fetchPosts(loadMore: true),
                  child: const Text('Load More'),
                ),
              );
            }
          },
        );
      },
    )
    );
  }
}