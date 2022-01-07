

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/core/domain/repository/add_exercise_repository.dart';



class ExerciseTile extends StatelessWidget {

  final TheExercise theExercise;
  final AddExerciseRepository addExerciseRepository;
  final String idOfProgram;

  ExerciseTile({required this.theExercise, required this.addExerciseRepository, required this.idOfProgram});

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
              title: Text(theExercise.name as String),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () { addExerciseRepository.delete(theExercise.id, idOfProgram); },),
            )
        )
    );
  }

}