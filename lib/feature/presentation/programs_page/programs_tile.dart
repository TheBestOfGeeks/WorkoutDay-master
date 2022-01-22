
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/feature/data/repository/add_program_repository_impl.dart';
import 'package:workoutday/feature/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'package:workoutday/feature/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/feature/domain/use_cases/add_program_usecase.dart';
import 'package:workoutday/feature/presentation/programs_page/update_program.dart';

import '../../domain/entities/entities/the_program.dart';

final AddProgramRepositoryImpl addProgramRepositoryImpl = AddProgramRepositoryImpl();

class ProgramTile extends StatelessWidget {


  final TheProgram theProgram;
  ProgramTile(this.theProgram);
  final AddProgramUseCase saveProgram = AddProgramUseCase(addProgramRepositoryImpl);




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
                backgroundColor: Color.fromRGBO(238,238,238, 1),
                backgroundImage: AssetImage('lib/assets/images/dd.png'),
                radius: 26.0,
              ),
              title: Text(theProgram.name),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){ saveProgram.deleteDocument(theProgram.id); },),
            ),

      )
    );
  }

}

