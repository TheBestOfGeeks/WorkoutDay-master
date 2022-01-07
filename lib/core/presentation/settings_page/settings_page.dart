

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/data/auth_service.dart';

class SettingsPage extends StatelessWidget {
// TODO Убрать сервис подключения напрямую
  final AuthService _auth  = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Row(
          children: [
            CupertinoButton(child: Text('Выйти'),
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