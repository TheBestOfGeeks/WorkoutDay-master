


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/domain/entities/the_workout.dart';

class WorkoutTale extends StatelessWidget {

  final TheWorkout theWorkout;

  WorkoutTale(this.theWorkout);

  @override
  Widget build(BuildContext context) {
     return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
          child: ListTile(
            onTap: ((){
            }) ,
            leading: CircleAvatar(
              radius: 15.0,
            ),
            title: Text(theWorkout.name as String),
            trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){},),
          ),

        )
    );
  }



}