

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/presentation/features/custom_floating_action_button.dart';
import 'package:workoutday/generated/l10n.dart';

import 'add_workout.dart';
import 'list_of_workouts.dart';


class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Trainings),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(AddWorkout(), S.of(context).StartTraining),
      body: ListOfWorkouts(),
    );

  }
}


