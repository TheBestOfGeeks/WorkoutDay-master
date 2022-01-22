

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/feature/domain/change_notifiers/change_notifier_grabIdOfSet.dart';
import 'package:workoutday/generated/l10n.dart';
import '../../data/repository/add_set_repository_impl.dart';
import '../../domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import '../../domain/entities/entities/the_set.dart';
import '../../domain/use_cases/add_set_usecase.dart';

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