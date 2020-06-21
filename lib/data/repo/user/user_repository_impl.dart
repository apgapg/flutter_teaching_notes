import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_notes/data/local/prefs/prefs_helper.dart';
import 'package:flutter_teaching_notes/data/model/result.dart';
import 'package:flutter_teaching_notes/data/model/user.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:rxdart/rxdart.dart';

import 'base/user_repository.dart';
import 'google_login_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Firestore firestore;
  final _userSubject = BehaviorSubject<User>.seeded(null);

  String _fcmToken;

  UserRepositoryImpl({@required this.firestore}) {
    init();
  }

  StreamTransformer<DocumentSnapshot, User> get _streamTransformer =>
      StreamTransformer.fromHandlers(handleData: (data, sink) {
        sink.add(User.fromJson(data.data));
      });

  @override
  Future<Result<User>> register(User user) async {
    try {
      final userDocument =
          await firestore.collection('users').document(user.id).get();
      if (userDocument != null && userDocument.exists) {
        //Do nothing
      } else {
        await userDocument.reference.setData(user.toJson());
      }
      prefsHelper.isLogin = true;
      await init();

      return Result(user);
    } catch (e, s) {
      logger.e(e, s);
      return Result.error('${e.message}');
    }
  }

  Future<void> init() async {
    try {
      final firebaseUser = await FirebaseAuth.instance.currentUser();
      if (firebaseUser == null) {
        _userSubject.add(null);
        return;
      }
      firestore
          .collection('users')
          .document(firebaseUser.uid)
          .snapshots()
          .listen((event) async {
        if (event != null) {
          _userSubject.add(User.fromJson(event.data));
          final _firebaseMessaging = FirebaseMessaging();
          _firebaseMessaging.setAutoInitEnabled(true);
          _fcmToken = await _firebaseMessaging.getToken();
          await firestore
              .collection('users')
              .document(firebaseUser.uid)
              .updateData({'fcmToken': _fcmToken});
        } else {
          _userSubject.add(null);
        }
      });
    } catch (e, s) {
      logger.e(e, s);
      _userSubject.addError(e);
    }
  }

  @override
  User getLoggedInUser() {
    return _userSubject.value;
  }

  @override
  Stream<User> getUserStream() {
    return _userSubject.stream;
  }

  @override
  bool isComplete() {
    return checkIfNotEmpty(getLoggedInUser().tagline) &&
        checkIfListIsNotEmpty(getLoggedInUser().educations);
  }

  @override
  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
    await injector<GoogleLoginRepository>().logout();
    prefsHelper.isLogin = false;
    prefsHelper.userData = null;
  }

  @override
  String getFcmToken() {
    // TODO: implement getFcmToken
    return _fcmToken;
  }
}
