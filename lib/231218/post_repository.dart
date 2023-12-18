import 'package:dart_basic/231218/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();

  Future<void> addPost(Post post);

  Future<void> deletePost(Post post);

  Future<void> updatePost(Post post);
}