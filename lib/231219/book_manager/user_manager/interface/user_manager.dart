import '../../model/user.dart';

abstract interface class UserManager {
  void addUser(User user);
  void updateUser(User user);
  void deleteUser(int id);
  void rollbackLastDeletedUser();

  void printAllUser();
}