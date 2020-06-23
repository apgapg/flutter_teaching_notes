import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_teaching_notes/data/model/user.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/data/repo/user/google_login_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/modules/profile/widgets/profile_header.dart';
import 'package:flutter_teaching_notes/utils/dialog_utils.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';
import 'package:flutter_teaching_notes/widgets/my_divider.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
    return StreamBuilder<User>(
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
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                  ),
                  MyDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${user.bookmarks?.length ?? 0}",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Bookmark(s)",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
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
                  Text("Signin to avail new set of features"),
                  SizedBox(
                    height: 24,
                  ),
                  PrimaryRaisedButton(
                    icon: SimpleLineIcons.social_google,
                    text: "Sign in with Google",
                    onTap: _login,
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
