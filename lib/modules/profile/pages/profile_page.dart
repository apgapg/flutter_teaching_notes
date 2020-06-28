import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_teaching_notes/data/model/user.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/data/repo/user/google_login_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/modules/bookmark/index.dart';
import 'package:flutter_teaching_notes/modules/profile/widgets/profile_header.dart';
import 'package:flutter_teaching_notes/modules/profile/widgets/review_card.dart';
import 'package:flutter_teaching_notes/utils/dialog_utils.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';
import 'package:flutter_teaching_notes/widgets/my_divider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final _googleLoginRepository = injector<GoogleLoginRepository>();

  Future<void> _login() async {
    try {
      DialogUtils.showProgressBar(context);
      final result = await _googleLoginRepository.login();
      result.when(
        (value) {
          DialogUtils.hideProgressBar(context);
          _onLoginSuccess();
        },
        loading: () {},
        error: (message) {
          DialogUtils.hideProgressBar(context);
          ToastUtils.show(message);
        },
      );
    } catch (e) {
      DialogUtils.hideProgressBar(context);
      ToastUtils.show(e?.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReviewCard(),
                MyDivider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        if (kIsWeb) {
                          launch('https://play.google.com/store/apps/'
                              'details?id=com.coddu.flutter.iitjee.notes');
                        } else {
                          Share.share(
                              'https://play.google.com/store/apps/'
                              'details?id=com.coddu.flutter.iitjee.notes',
                              subject: "Share App Link");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                SimpleLineIcons.share,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Share App with Others",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                MyDivider(),
              ],
            ),
          )
        : StreamBuilder<User>(
            stream: injector<UserRepository>().getUserStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              }
              if (snapshot.hasData && snapshot.data != null) {
                final user = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileHeader(
                        user: user,
                      ),
                      MyDivider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                FontAwesomeIcons.user,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Member since ${DateFormat('MMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(user.createdAt * 1000))}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      MyDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BookmarkPage(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${user.bookmarks?.length ?? 0}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0),
                                    child: Icon(
                                      FontAwesomeIcons.bookmark,
                                      size: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Bookmark(s)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      MyDivider(),
                      ReviewCard(),
                      MyDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              if (kIsWeb) {
                                launch('https://play.google.com/store/apps/'
                                    'details?id=com.coddu.flutter.iitjee.notes');
                              } else {
                                Share.share(
                                    'https://play.google.com/store/apps/'
                                    'details?id=com.coddu.flutter.iitjee.notes',
                                    subject: "Share App Link");
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Icon(
                                      SimpleLineIcons.share,
                                      size: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Share App with Others",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      MyDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              injector<UserRepository>().logoutUser();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "LOGOUT",
                                    style: TextStyle(color: Colors.red[300]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      MyDivider(),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return ErrorPage(snapshot.error.toString());
              } else {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/auth.png',
                        height: 150,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Unlock premium set of features"),
                      SizedBox(
                        height: 24,
                      ),
                      RaisedButton(
                        color: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              height: 24,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Sign in with Google"),
                          ],
                        ),
                        onPressed: _login,
                      ),
                    ],
                  ),
                );
              }
            });
  }

  void _onLoginSuccess() {
    ToastUtils.show("Login successful!");
  }

  @override
  bool get wantKeepAlive => true;
}
