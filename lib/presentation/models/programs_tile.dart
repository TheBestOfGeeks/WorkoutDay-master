
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/data/repository/add_program_repository_impl.dart';
import 'package:workoutday/domain/entities/the_program.dart';
import 'package:workoutday/domain/use_cases/add_program_usecase.dart';
import 'package:workoutday/presentation/models/add_program.dart';
import '../../data/services/change_notifier_service.dart';

final AddProgramRepositoryImpl addProgramRepositoryImpl = AddProgramRepositoryImpl();

class ProgramTile extends StatelessWidget {


  final TheProgram theProgram;
  ProgramTile(this.theProgram);
  AddProgramUseCase saveProgram = AddProgramUseCase(addProgramRepositoryImpl);
  @override
  Widget build(BuildContext context) {


    void _programSettingPanel() {
      showBottomSheet(context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return AddProgram(true);
          }
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
        margin: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
            child: ListTile(
              onTap: ((){
                context.read<DataChangeNotifierService>().changeIdOfExercise(theProgram.id);
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

