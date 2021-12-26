import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/data/repository/add_program_repository_impl.dart';
import 'package:workoutday/domain/entities/the_exercise.dart';
import 'package:workoutday/domain/entities/the_program.dart';
import 'package:workoutday/domain/use_cases/add_program_usecase.dart';
import 'package:workoutday/presentation/models/exercise_tile.dart';
import 'package:workoutday/data/channge_notifier.dart';
import 'package:workoutday/presentation/features/text_field_style.dart';
import 'package:workoutday/data/database_service.dart';


class AddProgram extends StatefulWidget {
bool isCreatedd;

  AddProgram(this.isCreatedd);
  @override
  _AddProgramState createState() => _AddProgramState(isCreated: isCreatedd);
}

final AddProgramRepositoryImpl addProgramRepositoryImpl = AddProgramRepositoryImpl();

class _AddProgramState extends State<AddProgram> {

  _AddProgramState({required this.isCreated});

  String nameOfProgram = '';
  String nameOfExercise = '';
  DatabaseService databaseService = DatabaseService();
  SaveProgram saveProgram = SaveProgram(addProgramRepositoryImpl);
  final _formKey = GlobalKey<FormState>();
  String _errorName = '';
  String idOfProgram = '';
  bool isCreated = false;


  @override
  Widget build(BuildContext context) {

    final _exercises = Provider.of<List<TheExercise>>(context);
    final _programs = Provider.of<List<TheProgram>>(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          builder: (BuildContext context, controller) {
            return Container(
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    //вызов метода ввода названия программы или её отображения.
                    createOrModify(_programs),
                    Text(
                      _errorName,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    hideAddProgramButton(_programs),
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
                                nameOfExercise = exerciseName;
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
                              for (var exOfProgram in _programs) {
                                if (exOfProgram.name == nameOfProgram) {
                                  idOfProgram = exOfProgram.id!;
                                  DatabaseService databaseServiceForAddExercise = DatabaseService(programId: idOfProgram);
                                  databaseServiceForAddExercise.addExercise(nameOfExercise);
                                  setState(() {
                                    _errorName = '';
                                  });
                                  break;
                                } else {
                                  setState(() {
                                    _errorName = 'Сначала сохраните программу';
                                  });
                                }
                              }
                              ;
                              // nameOfProgram
                            },
                            icon: Icon(
                              Icons.add_task,
                              size: 40,
                              color: Colors.black,
                              semanticLabel: 'Добавить упражнение',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 200,
                      child: ListView.builder(
                       // dragStartBehavior: DragStartBehavior.down,
                        itemBuilder: (BuildContext context, int index) {
                          return ExerciseTile(_exercises[index]);
                        },
                        itemCount: _exercises.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  // Меттод виджета, который вызывает либо создание программы либо её обновление в зависимости от того, где вызывается addProgram
  Widget createOrModify(programs) {
    if (isCreated) {
      TheProgram theProgram = programs.firstWhere((element) => element.id == context.watch<DataChangeNotifier>().getData);
      nameOfProgram = theProgram.name!;
      return Text(nameOfProgram, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),);
    } else {
return TextFormField(
  validator: (val) =>
  val!.isEmpty ? 'Введите имя программы' : null,
  onChanged: (programName) {
    setState(() {
      nameOfProgram = programName;
    });
  },
  style: TextStyle(height: 0.5),
  decoration: TextFieldStyle(
      'Имя программы',
      'Введите имя программы',
      Icon(Icons.add_circle_rounded))
      .style(),
  keyboardType: TextInputType.text,
);
    }
  }
//Сокрытие кнопки "Сохранить программу"
  Widget hideAddProgramButton(List<TheProgram> programs) {
    if (isCreated) {
      return SizedBox(
        height: 1,
      );
    } else {
      return CupertinoButton(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.black,
        child: Text('Сохранить программу',
            style: TextStyle(fontSize: 13)),
        onPressed: () => {
          if (_formKey.currentState!.validate()) {
            if (saveProgram.saveProgWithCheckDoubleName(nameOfProgram, programs, databaseService)){
              setState(() => _errorName = 'Программа с таким именем уже существует')
            } else {
              setState(() => _errorName = '')
            }
          }
        },
      );
    }
  }

} //Конец класса
