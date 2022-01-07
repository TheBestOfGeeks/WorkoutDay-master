

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/presentation/features/custom_floating_action_button.dart';

import 'add_workout.dart';
import 'list_of_workouts.dart';


class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Тренировки'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(AddWorkout(), 'Начать тренировку'),
      body: ListOfWorkouts(),
    );

  }
}


