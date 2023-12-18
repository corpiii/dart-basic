import 'package:dart_basic/231218/post.dart';
import 'package:dart_basic/231218/post_repository.dart';

class PostManager {
  final PostRepository _repository;

  const PostManager({
    required PostRepository repository,
  }) : _repository = repository;

  Future<void> addPost(Post post) async {
    await _repository.addPost(post);
  }

  Future<void> deletePost(Post post) async {
    await _repository.deletePost(post);
  }

  Future<void> updatePost(Post post) async {
    await _repository.updatePost(post);
  }

  Future<List<Post>> getPosts() async {
    return await _repository.getPosts();
  }
}