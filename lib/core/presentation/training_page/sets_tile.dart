

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/core/data/repository/add_set_repository_impl.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfSet.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import 'package:workoutday/core/domain/entities/entities/the_set.dart';
import 'package:workoutday/core/domain/use_cases/add_set_usecase.dart';
import 'package:workoutday/generated/l10n.dart';

AddSetRepositoryImpl _addSetRepositoryImpl = AddSetRepositoryImpl();

class SetsTile extends StatelessWidget {

  final TheSet set;

  final _addSetUseCase = AddSetUseCase(_addSetRepositoryImpl);


  SetsTile(this.set);

  @override
  Widget build(BuildContext context) {

    final _idOfWorkout = context.watch<ChangeNotifierGrabIdOfWorkout>().getData;
    final _idOfGymnastic = context.watch<ChangeNotifierGrabIdOfGymnastic>().getData;

    return Padding(
        padding: EdgeInsets.only(top: 3.0),
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
            child: ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(238,238,238, 1),
                backgroundImage: AssetImage('lib/assets/images/dd.png'),
                radius: 20.0,
              ),
              title: Text('${S.of(context).Weight}:${set.weight} ${S.of(context).Repetitions}:${set.repetition}'),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () { _addSetUseCase.deleteSet(idOfSet: set.id, gymnasticId: _idOfGymnastic, idOfWorkout: _idOfWorkout);  },),
            )
        )
    );
  }
  
}