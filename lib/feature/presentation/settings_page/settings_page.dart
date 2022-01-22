

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/generated/l10n.dart';

import '../../data/auth_service.dart';

class SettingsPage extends StatelessWidget {
// TODO Убрать сервис подключения напрямую
  final AuthService _auth  = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Settings),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    CupertinoButton(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.red,
                        child: Text(S.of(context).Exit),
                        onPressed: (() async {
await _auth.logOutUser();
                        }
                        )
                    ),

                ]

            ),
          ],
        ),
      ),
    );
  }
}