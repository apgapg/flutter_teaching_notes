import 'package:rxdart/rxdart.dart';

import '../../../model/my_user.dart';
import '../../../model/result.dart';

abstract class UserRepository {
  Future<Result<MyUser>> register(MyUser user);

  BehaviorSubject<MyUser> getUserStream();

  MyUser getLoggedInUser();

  String getFcmToken();

  void logoutUser() {}

  bool isComplete() {}

  void saveBookmark(String id);

  void removeBookmark(String id);
}
