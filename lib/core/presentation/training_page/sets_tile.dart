

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 3.0),
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
            child: ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              leading: CircleAvatar(
                radius: 20.0,
              ),
              title: Text('theExercise.name'),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () { },),
            )
        )
    );
  }
  
}