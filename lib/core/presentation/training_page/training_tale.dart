

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/presentation/training_page/update_training.dart';

class TrainingTale extends StatelessWidget {

  TheGymnastic gymnastic;

  TrainingTale(this.gymnastic);



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
              context.read<ChangeNotifierHideFloatingButton>().isFloatingButtonHide(true);
              _programSettingPanel();
            }) ,
            leading: CircleAvatar(
              radius: 15.0,
            ),
            title: Text(gymnastic.name),
            subtitle: Text(''),
            trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){},),
          ),

        )
    );
  }

}