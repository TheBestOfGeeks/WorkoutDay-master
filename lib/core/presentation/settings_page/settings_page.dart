

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/data/auth_service.dart';
import 'package:workoutday/generated/l10n.dart';

class SettingsPage extends StatelessWidget {
// TODO Убрать сервис подключения напрямую
  final AuthService _auth  = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Settings),
      ),
      body: Row(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
              CupertinoButton(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.blue,
                  child: Text(S.of(context).Exit),
                  onPressed: (() async {
await _auth.logOutUser();
                  }
                  )
              ),

          ]

      ),
    );
  }
}