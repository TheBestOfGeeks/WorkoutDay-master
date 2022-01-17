import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/data/repository/add_workout_repository_impl.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';
import 'package:workoutday/core/domain/use_cases/add_workout_usecase.dart';
import 'package:workoutday/core/presentation/training_page/training_page.dart';

AddWorkoutRepositoryImpl _addWorkoutRepositoryImpl = AddWorkoutRepositoryImpl();

class WorkoutTale extends StatelessWidget {

  final TheWorkout _theWorkout;

  WorkoutTale(this._theWorkout);

  final _addWorkoutUseCase =  AddWorkoutUsecase(_addWorkoutRepositoryImpl);


  @override
  Widget build(BuildContext context) {


    String _name = _theWorkout.name as String;
    var _time = DateFormat.yMMMMEEEEd('RU').format(_theWorkout.date.toDate());
     return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
            child: ListTile(
              onTap: ((){
                context.read<ChangeNotifierGrabIdOfProgram>().changeIdOfProgram(_theWorkout.idOfParentProgram);
                context.read<ChangeNotifierGrabIdOfWorkout>().changeIdOfWorkout(_theWorkout.id);
                Navigator.push(context, MaterialPageRoute(builder:(context) => TrainingPage(_theWorkout)));
              }) ,
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(238,238,238, 1),
                backgroundImage: AssetImage('lib/assets/images/dd.png'),
                radius: 26.0,
              ),
              title: Text('$_name'),
              subtitle: Text('$_time'),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){ _addWorkoutUseCase.deleteWorkout(_theWorkout.id); },),
            ),

          )
    );

  }



}