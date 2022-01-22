import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/feature/presentation/features/text_field_style.dart';


import 'package:workoutday/generated/l10n.dart';


import '../../data/repository/add_exercise_repository_impl.dart';
import '../../data/repository/add_program_repository_impl.dart';
import '../../domain/entities/entities/the_program.dart';
import '../../domain/use_cases/add_exercise_usecase.dart';
import '../../domain/use_cases/add_program_usecase.dart';





class AddProgram extends StatefulWidget {


  AddProgram();
  @override
  _AddProgramState createState() => _AddProgramState();
}

final AddProgramRepositoryImpl addProgramRepositoryImpl = AddProgramRepositoryImpl();
final AddExerciseRepositoryImpl addExerciseRepositoryImpl = AddExerciseRepositoryImpl();

class _AddProgramState extends State<AddProgram> {


  _AddProgramState();

  String _nameOfProgram = '';
  AddProgramUseCase saveProgram = AddProgramUseCase(addProgramRepositoryImpl);
  AddExerciseUseCase saveExercise = AddExerciseUseCase(addExerciseRepositoryImpl);
  final _formKey = GlobalKey<FormState>();
  String _errorName = '';
  String idOfProgram = '';


  @override
  Widget build(BuildContext context) {

    final _programs = Provider.of<List<TheProgram>>(context);


    return GestureDetector(
    onTap: (){
      Navigator.of(context).pop();
      },
      behavior: HitTestBehavior.opaque,
      child: DraggableScrollableSheet(
        minChildSize: 0.6,
          initialChildSize: 0.7,
          builder: (BuildContext context, controller) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40), bottom: Radius.circular(40)),
                color: Color.fromRGBO(238,238,238, 1),
            ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    //вызов метода ввода названия программы или её отображения.
                    TextFormField(
                    validator: (val) =>
                val!.isEmpty ? S.of(context).EnterProgramName : null,
                onChanged: (programName) {
                  setState(() {
                    _nameOfProgram = programName;
                  });
                },
                style: TextStyle(height: 0.5),
                decoration: TextFieldStyle(S.of(context).ProgramName, S.of(context).EnterProgramName, Icon(Icons.add_circle_rounded)).style(),
                keyboardType: TextInputType.text,
              ),
                    Text(
                      _errorName,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
              CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.redAccent,
                child: Text(S.of(context).SaveProgram,
                    style: TextStyle(fontSize: 13)),
                onPressed: () => {
                  if (_formKey.currentState!.validate()) {
                    if (saveProgram.saveProgWithCheckDoubleName(_nameOfProgram, _programs)){
                      setState(() => _errorName = S.of(context).NameOfProgramExist)
                    } else {
                      setState(() => _errorName = '')
                    }
                  }
                },
              ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

} //Конец класса
