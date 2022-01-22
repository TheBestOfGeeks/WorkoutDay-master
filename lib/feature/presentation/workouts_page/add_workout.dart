

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:workoutday/feature/data/repository/add_workout_repository_impl.dart';
import 'package:workoutday/generated/l10n.dart';

import '../../domain/entities/entities/the_program.dart';
import '../../domain/use_cases/add_workout_usecase.dart';





class AddWorkout extends StatefulWidget {
  @override
  AddWorkoutState createState() => AddWorkoutState();
}

AddWorkoutRepositoryImpl _addWorkoutRepositoryImpl = AddWorkoutRepositoryImpl();

class AddWorkoutState extends State<AddWorkout> {


  AddWorkoutUsecase _workoutUsecase = AddWorkoutUsecase(_addWorkoutRepositoryImpl);
  final _initialDate = DateTime.now();
  int _index = 0;
  late FixedExtentScrollController _scrollController;
  String _nameOfWorkout = '';
  bool _WorkoutIsDone = false;
  late String _idOfParentProgram;

  @override
  void initState() {
    _scrollController = FixedExtentScrollController(initialItem: _index);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _programs = Provider.of<List<TheProgram>>(context);
    _nameOfWorkout = _programs.elementAt(_index).name;
    _idOfParentProgram = _programs.elementAt(_index).id;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40), bottom: Radius.circular(40)),
                color: Color.fromRGBO(238,238,238, 1),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                child: ListView(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    SizedBox(
                      height: 150,
                      child: CupertinoPicker(
                        scrollController: _scrollController,
                        itemExtent: 64,
                        onSelectedItemChanged: (index) {
                          _index = index;
                          setState(() {});
                        },
                        children: _programs.map((item) => Center(child: Text(item.name.toString()),)).toList(),
                      ),
                    ),
                 OutlinedButton(onPressed: (){ },
                     child: Text(DateFormat('dd.MM.yyyy').format(_initialDate), style: TextStyle(fontSize: 20, color: Colors.black),),
                   style: TextButton.styleFrom(side: BorderSide(color: Colors.grey), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                 ),
                  SizedBox(height: 20,),
                  CupertinoButton(child: Text(S.of(context).StartTraining),color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20)),
                    onPressed: (){
                      _workoutUsecase.saveWorkout(nameOfWorkout: _nameOfWorkout,dateOfWorkout:  _initialDate,isDone:  _WorkoutIsDone, idOfParentProgram: _idOfParentProgram);
                      }, ),
                  ]
                )
              )
          );
        },
      ),
    );
  }
}

