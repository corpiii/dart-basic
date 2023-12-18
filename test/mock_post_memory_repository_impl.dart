import 'dart:async';

import 'package:dart_basic/231218/post.dart';
import 'package:dart_basic/231218/post_repository.dart';

class MockPostMemoryRepositoryImple implements PostRepository {
  final List<Post> postList = [];

  @override
  Future<void> addPost(Post post) async {
    postList.add(post);
  }

  @override
  Future<void> deletePost(Post post) async {
    postList.remove(post);
  }

  @override
  Future<List<Post>> getPosts() async {
    return Future.value(postList);
  }

  @override
  Future<void> updatePost(Post post) async {
    var updatedIndex = post.id;

    postList.map((e) {
      if (e.id == updatedIndex) {
        e = post;
      }
    });
  }
}