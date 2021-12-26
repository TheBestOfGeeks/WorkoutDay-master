

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/presentation/models/add_workout.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _programSettingPanel() {
      showModalBottomSheet(context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return AddWorkout();
          }
      );
    }


    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          _programSettingPanel()
        },
        icon: Icon(Icons.add),
        label: Text('Начать тренировку'),
      ),
      body: Center(
        child: Text('data'),
      ),
    );

  }
}
