import 'package:dart_basic/231218/post.dart';
import 'package:dart_basic/231218/post_manager.dart';
import 'mock_post_memory_repository_impl.dart';
import 'package:dart_basic/231218/top_level.dart';
import 'package:test/test.dart';

void main() {
  group('top_level_test', () {
    test('when_number_is_given_then_judge_even_or_odd', () {
      expect(isEven(0), true);
      expect(isEven(3), false);
      expect(isEven(4), true);
    });

    test('when_List<int>_given_then_return_max_value_in_list', () {
      expect(findMax([1, 2, 3, 4]), 4);
      expect(findMax([-100, -10, 0, 100]), 100);
      expect(findMax([-100, -300, -200, -500]), -100);
    });

    test('when_String_is_given_then_return_reserved_String', () {
      expect(reverseString('Hello'), 'olleH');
      expect(reverseString('hah aha'), 'aha hah');
    });
  });

  group('post_manager_test', () {
    var mockRepository;

    setUp(() {
      mockRepository = MockPostMemoryRepositoryImple();
    });

    test('postManager_addPost_test', () async {
      // given
      var postManager = PostManager(repository: mockRepository);

      var post = Post(
          userId: 1,
          id: 1,
          title: 'testTitle',
          body: 'testBody');

      // when
      postManager.addPost(post);

      // then
      var result = await postManager.getPosts();

      expect(result[0], post);
    });

    test('postManager_deletePost_test', () async {
      // given
      var postManager = PostManager(repository: mockRepository);

      var post = Post(
          userId: 2,
          id: 2,
          title: 'testTitle',
          body: 'testBody');

      // when
      postManager.addPost(post);
      postManager.deletePost(post);

      // then
      var result = await postManager.getPosts();
      print(result.length);
      expect(result.isEmpty, true);
    });
  });
}
