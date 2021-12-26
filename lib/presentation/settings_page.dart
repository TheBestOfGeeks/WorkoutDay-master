

import 'package:flutter/cupertino.dart';
import 'package:workoutday/data/auth_service.dart';

class SettingsPage extends StatelessWidget {

  final AuthService _auth  = AuthService();

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          CupertinoButton(child: Text('Выйти'),
              onPressed: (() async {
await _auth.logOutUser();
              }
              )
          ),
        ]

    );
  }
}