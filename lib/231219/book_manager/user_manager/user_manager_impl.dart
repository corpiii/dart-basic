import 'package:dart_basic/231219/book_manager/model/user.dart';
import 'package:dart_basic/231219/book_manager/user_manager/interface/user_manager.dart';

class UserManagerImpl implements UserManager {
  List<User> _userList = [];

  @override
  void addUser(User user) {
    print('회원을 등록합니다');
    print(user);
    _userList.add(user);
  }

  @override
  void deleteUser(int id) {
    // TODO: implement deleteUser
  }

  @override
  void printAllUser() {
    print('회원 목록 입니다.');
    for (var user in _userList) {
      print(user);
    }
  }

  @override
  void rollbackLastDeletedUser() {
    // TODO: implement rollbackLastDeletedUser
  }

  @override
  void updateUser(User user) {
    // TODO: implement updateUser
  }

  @override
  User findUserById(int id) {
    User user = _userList.where((element) => element.id == id).first;

    return user.copyWith();
  }
}