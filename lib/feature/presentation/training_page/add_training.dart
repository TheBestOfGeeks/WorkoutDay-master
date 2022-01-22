

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/feature/data/repository/add_gymnastic_repository_impl.dart';
import 'package:workoutday/feature/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/feature/domain/entities/entities/the_workout.dart';
import 'package:workoutday/feature/domain/use_cases/add_gymnastic_usecase.dart';

import 'package:workoutday/generated/l10n.dart';

class AddTraining extends StatefulWidget {
  final TheWorkout _theWorkout;

  AddTraining(this._theWorkout);

  @override
  State<StatefulWidget> createState() {
  return AddTrainingState(_theWorkout);
  }
}
AddGymnasticRepositoryImpl addGymnasticRepository = AddGymnasticRepositoryImpl();


class AddTrainingState extends State<AddTraining> {
  TheWorkout _theWorkout;
  AddGymnasticUseCase addGymnasticUseCase = AddGymnasticUseCase(addGymnasticRepository);

  AddTrainingState(this._theWorkout);

  int _index = 0;
  String _nameOfExercise = '';
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    _scrollController = FixedExtentScrollController(initialItem: _index);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final _exercises = Provider.of<List<TheExercise>>(context);

 return GestureDetector(
   behavior: HitTestBehavior.opaque,
   onTap: () => Navigator.of(context).pop(),
   child: DraggableScrollableSheet(
     initialChildSize: 0.5,
     builder: (BuildContext context, ScrollController scrollController) {
       return Container(
           margin: EdgeInsets.only(bottom: 20),
           decoration: const BoxDecoration(
             borderRadius: BorderRadius.vertical(top: Radius.circular(40), bottom: Radius.circular(40)),
             color: Color.fromRGBO(238,238,238, 1),
           ),
           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
           child: ListView(
             physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
             children: [
               SizedBox(
                 height: 150,
                 child:  CupertinoPicker(
                   scrollController: _scrollController,
                   itemExtent: 64,
                   onSelectedItemChanged: (index) {
                     _index = index;
                     setState(() {});
                   },
                   children: _exercises.length > 0 ?  _exercises.map((item) => Center(child: Text(item.name.toString()),)).toList() : [Text(S.of(context).NoOneTrainingIsFound)],
                 ),
               ),
               CupertinoButton(
                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
                 color: Colors.blue,
                 onPressed: () {
                 _nameOfExercise = _exercises.elementAt(_index).name;
                 addGymnasticUseCase.saveGymnastic(workoutId:  _theWorkout.id,gymnasticName:  _nameOfExercise);
               },
                 child: Text(S.of(context).Add),
               )
             ],
           ),
       );
     },
   ),
 );

  }

}