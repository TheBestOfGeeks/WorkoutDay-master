

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/data/repository/add_gymnastic_repository_impl.dart';
import 'package:workoutday/core/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';
import 'package:workoutday/core/domain/use_cases/add_gymnastic_usecase.dart';

class AddTraining extends StatefulWidget {
  TheWorkout _theWorkout;

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
  String _nameOfExercise = 'Error name';
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
                   children: _exercises.length > 0 ?  _exercises.map((item) => Center(child: Text(item.name.toString()),)).toList() : [Text('Не добавлено ни одной тренировки')],
                 ),
               ),
               CupertinoButton(onPressed: () {
                 _nameOfExercise = _exercises.elementAt(_index).name;
                 addGymnasticUseCase.saveGymnastic(_theWorkout.id, _nameOfExercise);
               },
                 child: Text('Добавить'),
               )
             ],
           ),
       );
     },
   ),
 );

  }

}