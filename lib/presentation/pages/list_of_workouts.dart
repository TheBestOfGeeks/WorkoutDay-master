


import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/domain/entities/the_workout.dart';
import 'package:workoutday/presentation/models/programs_tile.dart';
import 'package:workoutday/presentation/models/workout_tale.dart';



class ListOfWorkouts extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ListOfWorkoutsState();
  }
}

class ListOfWorkoutsState extends State<ListOfWorkouts> {

  @override
  Widget build(BuildContext context) {

    final workouts  = Provider.of<List<TheWorkout>?>(context) ?? [];
    return
      AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: SlideAnimation(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: -300,
                  verticalOffset: -850,
                  child: WorkoutTale(workouts[index]),
                ),
              ),
            );
          },

        ),
      );
  }
}