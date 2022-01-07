
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/core/data/repository/add_program_repository_impl.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/domain/entities/entities/the_program.dart';
import 'package:workoutday/core/domain/use_cases/add_program_usecase.dart';
import 'package:workoutday/core/presentation/programs_page/update_program.dart';

final AddProgramRepositoryImpl addProgramRepositoryImpl = AddProgramRepositoryImpl();

class ProgramTile extends StatelessWidget {


  final TheProgram theProgram;
  ProgramTile(this.theProgram);
  AddProgramUseCase saveProgram = AddProgramUseCase(addProgramRepositoryImpl);




  Widget build(BuildContext context) {
    void _programSettingPanel() {
      showBottomSheet(context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return UpdateProgram();
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
                context.read<ChangeNotifierGrabIdOfProgram>().changeIdOfProgram(theProgram.id);
                context.read<ChangeNotifierHideFloatingButton>().isFloatingButtonHide(true);
                _programSettingPanel();
              }) ,
              leading: CircleAvatar(
                radius: 15.0,
              ),
              title: Text(theProgram.name as String),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){ saveProgram.deleteDocument(theProgram.id); },),
            ),

      )
    );
  }

}

