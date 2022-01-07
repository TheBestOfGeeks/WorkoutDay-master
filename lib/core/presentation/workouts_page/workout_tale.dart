import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import 'package:workoutday/core/domain/entities/entities/the_program.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';
import 'package:workoutday/core/presentation/training_page/training_page.dart';



class WorkoutTale extends StatelessWidget {

  final TheWorkout _theWorkout;

  WorkoutTale(this._theWorkout);



  @override
  Widget build(BuildContext context) {


    String _name = _theWorkout.name as String;
    var _time = DateFormat('yMMMMEEEEd').format(_theWorkout.date.toDate());
    final _programs = Provider.of<List<TheProgram>>(context);
    TheProgram theProgram = _programs.firstWhere((element) => element.name == _theWorkout.name);
     return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
            child: ListTile(
              onTap: ((){
                context.read<ChangeNotifierGrabIdOfProgram>().changeIdOfProgram(theProgram.id);
                context.read<ChangeNotifierGrabIdOfWorkout>().changeIdOfWorkout(_theWorkout.id);
                Navigator.push(context, MaterialPageRoute(builder:(context) => TrainingPage(_theWorkout)));
              }) ,
              leading: CircleAvatar(
                radius: 15.0,
              ),
              title: Text('$_name'),
              subtitle: Text('$_time'),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){},),
            ),

          )
    );

  }



}