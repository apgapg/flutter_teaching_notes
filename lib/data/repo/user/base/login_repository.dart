import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/data/model/my_user.dart';
import 'package:flutter_teaching_notes/data/model/result.dart';
import 'package:flutter_teaching_notes/data/model/void_result.dart';
import 'package:flutter_teaching_notes/di/injector.dart';

import 'user_repository.dart';

abstract class LoginRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  final _userRepository = injector<UserRepository>();

  @protected
  Future<FirebaseUser> getFirebaseUser(AuthCredential credential) async {
    return (await _firebaseAuth.signInWithCredential(credential)).user;
  }

  @protected
  // ignore: lines_longer_than_80_chars
  Future<Result<MyUser>> registerUser(MyUser user) =>
      _userRepository.register(user);

  Future<Result<MyUser>> login();

  Future<VoidResult> logout();

  Future<bool> isLoggedIn();
}

class LoginProvider {
  LoginProvider._();

  static const google = "Google";
}
