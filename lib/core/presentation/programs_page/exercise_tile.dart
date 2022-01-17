

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/data/repository/add_exercise_repository_impl.dart';
import 'package:workoutday/core/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/core/domain/use_cases/add_exercise_usecase.dart';

 AddExerciseRepositoryImpl addExerciseRepositoryImpl = AddExerciseRepositoryImpl();

class ExerciseTile extends StatelessWidget {

  final TheExercise theExercise;
  final String idOfProgram;
  final addExerciseUseCase = AddExerciseUseCase(addExerciseRepositoryImpl);

  ExerciseTile({required this.theExercise, required this.idOfProgram});

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
                backgroundColor: Color.fromRGBO(238,238,238, 1),
                backgroundImage: AssetImage('lib/assets/images/dd.png'),
                radius: 20.0,
              ),
              title: Text(theExercise.name),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () {  addExerciseUseCase.deleteExercise(idOfExercise: theExercise.id, idOfProgram: idOfProgram); },),
            )
        )
    );
  }

}