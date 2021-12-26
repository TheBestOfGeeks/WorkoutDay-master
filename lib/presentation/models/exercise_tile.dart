

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/domain/entities/the_exercise.dart';


class ExerciseTile extends StatelessWidget {

  late final TheExercise theExercise;
  ExerciseTile(this.theExercise);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 3.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 0.0),
            child: ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              leading: CircleAvatar(
                radius: 20.0,
              ),
              title: Text(theExercise.name as String),
            )
        )
    );
  }

}