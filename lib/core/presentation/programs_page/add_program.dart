import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/data/repository/add_exercise_repository_impl.dart';
import 'package:workoutday/core/data/repository/add_program_repository_impl.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/domain/entities/entities/the_program.dart';
import 'package:workoutday/core/domain/use_cases/add_exercise_usecase.dart';
import 'package:workoutday/core/domain/use_cases/add_program_usecase.dart';
import 'package:workoutday/core/presentation/features/text_field_style.dart';




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
  String _nameOfExercise = '';
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
                val!.isEmpty ? 'Введите имя программы' : null,
                onChanged: (programName) {
                  setState(() {
                    _nameOfProgram = programName;
                  });
                },
                style: TextStyle(height: 0.5),
                decoration: TextFieldStyle('Имя программы', 'Введите имя программы', Icon(Icons.add_circle_rounded)).style(),
                keyboardType: TextInputType.text,
              ),
                    Text(
                      _errorName,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
              CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.black,
                child: Text('Сохранить программу',
                    style: TextStyle(fontSize: 13)),
                onPressed: () => {
                  if (_formKey.currentState!.validate()) {
                    if (saveProgram.saveProgWithCheckDoubleName(_nameOfProgram, _programs)){
                      setState(() => _errorName = 'Программа с таким именем уже существует')
                    } else {
                      setState(() => _errorName = '')
                    }
                  }
                },
              ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            onChanged: (exerciseName) {
                              setState(() {
                                _nameOfExercise = exerciseName;
                              });
                            },
                            style: TextStyle(
                              height: 0.5,
                            ),
                            decoration: TextFieldStyle('Упражнение', 'Название упражнения', Icon(Icons.add)).style(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              bool addOrNot = false;
                              addOrNot = saveExercise.addExercise(_nameOfExercise, _programs, _nameOfProgram);
                              if (addOrNot) {
                                _errorName = '';
                              } else {
                                _errorName = 'Сначала сохраните программу';
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.add_task,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
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
