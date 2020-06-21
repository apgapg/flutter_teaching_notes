import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/data/model/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;
  final bool showEmail;

  const ProfileHeader({
    Key key,
    @required this.user,
    this.showEmail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(user.avatar),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  //  if (user.isVerified) VerifiedBadge(),
                ],
              ),
              Text(
                user.email,
                style:
                    Theme.of(context).textTheme.display1.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
