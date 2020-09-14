import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_notes/data/local/prefs/prefs_helper.dart';
import 'package:flutter_teaching_notes/data/model/my_user.dart';
import 'package:flutter_teaching_notes/data/model/result.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:rxdart/rxdart.dart';

import 'base/user_repository.dart';
import 'google_login_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore;
  final _userSubject = BehaviorSubject<MyUser>.seeded(null);

  String _fcmToken;

  UserRepositoryImpl({@required this.firestore}) {
    init();
  }

  StreamTransformer<DocumentSnapshot, MyUser> get _streamTransformer =>
      StreamTransformer.fromHandlers(handleData: (data, sink) {
        sink.add(MyUser.fromJson(data.data()));
      });

  @override
  Future<Result<MyUser>> register(MyUser user) async {
    try {
      final userDocument =
          await firestore.collection('users').doc(user.id).get();
      if (userDocument != null && userDocument.exists) {
        //Do nothing
      } else {
        final userMap = {
          ...user.toJson(),
          "createdAt": _getCurrentEpoch(),
          "updatedAt": _getCurrentEpoch(),
        };

        await userDocument.reference.setData(userMap);
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
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        _userSubject.add(null);
        return;
      }
      firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .snapshots()
          .listen((event) async {
        if (event?.data != null) {
          _userSubject.add(MyUser.fromJson(event.data()));
          final _firebaseMessaging = FirebaseMessaging();
          _firebaseMessaging.setAutoInitEnabled(true);
          _fcmToken = await _firebaseMessaging.getToken();
          await firestore.collection('users').doc(firebaseUser.uid).updateData({
            'fcmToken': _fcmToken,
            'updatedAt': _getCurrentEpoch(),
          });
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
  MyUser getLoggedInUser() {
    return _userSubject.value;
  }

  @override
  BehaviorSubject<MyUser> getUserStream() {
    return _userSubject;
  }

  @override
  bool isComplete() {
    return false;
  }

  @override
  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
    await injector<GoogleLoginRepository>().logout();
    prefsHelper.isLogin = false;
    prefsHelper.userData = null;
    _userSubject.sink.add(null);
    ToastUtils.show("Successfully logout!");
  }

  @override
  String getFcmToken() {
    return _fcmToken;
  }

  int _getCurrentEpoch() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  @override
  void saveBookmark(String id) {
    firestore.collection('users').doc(_userSubject.value.id).updateData({
      'bookmarks': FieldValue.arrayUnion([id]),
    });
  }

  @override
  void removeBookmark(String id) {
    firestore.collection('users').doc(_userSubject.value.id).updateData({
      'bookmarks': FieldValue.arrayRemove([id]),
    });
  }
}
