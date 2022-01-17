import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';
import 'package:workoutday/core/presentation/features/custom_floating_action_button.dart';
import 'package:workoutday/core/presentation/training_page/training_tale.dart';
import 'package:workoutday/generated/l10n.dart';

import 'add_training.dart';


class TrainingPage extends StatefulWidget {
  final TheWorkout _theWorkout;

  @override
  State<StatefulWidget> createState() {
    return TrainingPageState(_theWorkout);
  }

  TrainingPage(this._theWorkout);
}

class TrainingPageState extends State<TrainingPage> {
  final TheWorkout _theWorkout;
  TrainingPageState(this._theWorkout);



  @override
  Widget build(BuildContext context) {

    bool _hideFloatingButton = context.watch<ChangeNotifierHideFloatingButton>().getHideOrNotButton;
    var _time = DateFormat.yMMMMEEEEd('RU-ru').format(_theWorkout.date.toDate());
final _gymnastics = Provider.of<List<TheGymnastic>>(context);

    return WillPopScope(
      onWillPop: () async {
        context.read<ChangeNotifierHideFloatingButton>().isFloatingButtonHide(false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('''${_theWorkout.name}
           ${_time}''', style: TextStyle(fontSize: 15),),
          centerTitle: true,
        ),
        body: AnimationLimiter(
          child: ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index){
             return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    horizontalOffset: -300,
                    verticalOffset: -850,
                    child: TrainingTale(_gymnastics[index], _theWorkout),
                  ),
                ),
              );
          },
            itemCount: _gymnastics.length,
            ),
        ),
        floatingActionButton: _hideFloatingButton ? Container() : CustomFloatingActionButton(AddTraining(_theWorkout), S.of(context).AddExercise),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ),
    );
  }
}

