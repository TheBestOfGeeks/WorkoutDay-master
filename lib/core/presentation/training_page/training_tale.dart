import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/core/data/repository/add_gymnastic_repository_impl.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfSet.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/domain/entities/entities/the_workout.dart';
import 'package:workoutday/core/domain/use_cases/add_gymnastic_usecase.dart';
import 'package:workoutday/core/presentation/training_page/update_training.dart';

AddGymnasticRepositoryImpl addGymnasticRepositoryImpl = AddGymnasticRepositoryImpl();

class TrainingTale extends StatelessWidget {

  final TheGymnastic gymnastic;
  final TheWorkout workout;

  TrainingTale(this.gymnastic, this.workout);

  final addGymnasticUseCase =  AddGymnasticUseCase(addGymnasticRepositoryImpl);



  @override
  Widget build(BuildContext context) {

    void _programSettingPanel() {
      showBottomSheet(context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return UpdateTraining(gymnastic);
          }
      );
    }


    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
          child: ListTile(
            onTap: ((){
              context.read<ChangeNotifierGrabIdOfGymnastic>().changeIdOfGymnastic(gymnastic.id);
              context.read<ChangeNotifierHideFloatingButton>().isFloatingButtonHide(true);
              _programSettingPanel();
            }) ,
            leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(238,238,238, 1),
              backgroundImage: AssetImage('lib/assets/images/dd.png'),
              radius: 26.0,
            ),
            title: Text(gymnastic.name),
            trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){ addGymnasticUseCase.deleteGymnastic(workoutId:  workout.id,idOfGymnastic:  gymnastic.id);  },),
          ),

        )
    );
  }

}