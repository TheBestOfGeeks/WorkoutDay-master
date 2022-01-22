import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/feature/data/repository/add_exercise_repository_impl.dart';
import 'package:workoutday/feature/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'package:workoutday/feature/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/feature/domain/entities/entities/the_exercise.dart';
import 'package:workoutday/feature/domain/entities/entities/the_program.dart';
import 'package:workoutday/feature/domain/use_cases/add_exercise_usecase.dart';
import 'package:workoutday/feature/presentation/features/text_field_style.dart';
import 'package:workoutday/feature/presentation/programs_page/exercise_tile.dart';
import 'package:workoutday/generated/l10n.dart';


class UpdateProgram extends StatefulWidget {

  UpdateProgram();
  @override
  _UpdateProgramState createState() => _UpdateProgramState();
}
final AddExerciseRepositoryImpl addExerciseRepositoryImpl = AddExerciseRepositoryImpl();

class _UpdateProgramState extends State<UpdateProgram> {

  _UpdateProgramState();

  String _nameOfProgram = '';
  String _nameOfExercise = '';
  AddExerciseUseCase saveExercise = AddExerciseUseCase(addExerciseRepositoryImpl);
  final _formKey = GlobalKey<FormState>();
  String _errorName = '';
  String idOfProgram = '';


  @override
  Widget build(BuildContext context) {

    final _exercises = Provider.of<List<TheExercise>>(context);
    final _programs = Provider.of<List<TheProgram>>(context);
    TheProgram theProgram = _programs.firstWhere((element) => element.id == context.watch<ChangeNotifierGrabIdOfProgram>().getData);
    _nameOfProgram = theProgram.name;
    return GestureDetector(
      onTap: (){
        context.read<ChangeNotifierHideFloatingButton>().isFloatingButtonHide(false);
        Navigator.of(context).pop();
      },
      onVerticalDragEnd: (DragEndDetails details){
        context.read<ChangeNotifierHideFloatingButton>().isFloatingButtonHide(false);
        Navigator.of(context).pop();
      },
      behavior: HitTestBehavior.opaque,
      child: DraggableScrollableSheet(
          minChildSize: 0.1,
          initialChildSize: 0.9,
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
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    //вызов метода ввода названия программы или её отображения.
                  Text(_nameOfProgram, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text(
                      _errorName,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                SizedBox(
                  height: 1,
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
                            decoration: TextFieldStyle(S.of(context).Exercise, S.of(context).NameOfExercise, Icon(Icons.add)).style(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              bool addOrNot = false;
                              addOrNot = saveExercise.addExercise(nameOfExercise:  _nameOfExercise, programs:  _programs, nameOfProgram:  _nameOfProgram);
                              if (addOrNot) {
                                _errorName = '';
                              } else {
                                _errorName = S.of(context).FirstSaveTheProgram;
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
                    AnimationLimiter(
                  child: Container(
                    //padding: EdgeInsets.all(10),
                    height: 400,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: _exercises.length,
                      itemBuilder: (BuildContext context, int index) {
                        _exercises.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
                        return ExerciseTile(theExercise:  _exercises[index], idOfProgram: theProgram.id,);
                      },

                    ),
                  ),
                ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

