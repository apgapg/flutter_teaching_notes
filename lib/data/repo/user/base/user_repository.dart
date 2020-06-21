import '../../../model/result.dart';
import '../../../model/user.dart';

abstract class UserRepository {
  Future<Result<User>> register(User user);

  Stream<User> getUserStream();

  User getLoggedInUser();

  String getFcmToken();

  void logoutUser() {}

  bool isComplete() {}
}
