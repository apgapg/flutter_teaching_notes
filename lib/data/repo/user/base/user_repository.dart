import 'package:rxdart/rxdart.dart';

import '../../../model/result.dart';
import '../../../model/user.dart';

abstract class UserRepository {
  Future<Result<User>> register(User user);

  BehaviorSubject<User> getUserStream();

  User getLoggedInUser();

  String getFcmToken();

  void logoutUser() {}

  bool isComplete() {}

  void saveBookmark(String id);

  void removeBookmark(String id);
}
