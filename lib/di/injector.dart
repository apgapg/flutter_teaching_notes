import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_teaching_notes/data/local/prefs/prefs_helper.dart';
import 'package:flutter_teaching_notes/data/local/prefs/shared_prefs.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/data/repo/user/google_login_repository.dart';
import 'package:flutter_teaching_notes/data/repo/user/user_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

GetIt injector = GetIt.instance;

class Injector {
  factory Injector() => _singleton;

  Injector._internal();

  static final Injector _singleton = Injector._internal();

  Future<void> init() async {
    await _initRepos();
  }

  Future<void> _initRepos() async {
    // SharedPreferences
    final prefs = SharedPrefs();

    await SharedPrefsHelper().initialize(prefs);
    injector.registerSingleton<SharedPrefsHelper>(
      prefsHelper,
    );

    injector.registerSingleton<Firestore>(Firestore.instance);
    // UserRepository
    injector.registerSingleton<UserRepository>(UserRepositoryImpl(
      firestore: injector(),
    ));
    // GoogleLoginRepository
    injector.registerLazySingleton<GoogleLoginRepository>(
      () => GoogleLoginRepository(
        googleSignIn: GoogleSignIn(),
      ),
    );

    // ApplicationBloc;
    // ignore: cascade_invocations
    /* injector.registerSingleton<ApplicationBloc>(
      ApplicationBloc(),
    );*/
  }
}
