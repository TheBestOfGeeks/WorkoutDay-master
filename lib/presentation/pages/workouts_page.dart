

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/presentation/features/custom_floating_action_button.dart';
import 'package:workoutday/presentation/models/add_workout.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(AddWorkout(), 'Начать тренировку'),
      body: Center(
        child: Text('data'),
      ),
    );

  }
}


