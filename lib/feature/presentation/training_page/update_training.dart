import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:workoutday/feature/presentation/training_page/sets_tile.dart';
import 'package:workoutday/generated/l10n.dart';
import '../../data/repository/add_set_repository_impl.dart';
import '../../domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import '../../domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import '../../domain/entities/entities/the_gymnastic.dart';
import '../../domain/entities/entities/the_set.dart';
import '../../domain/use_cases/add_set_usecase.dart';
import '../features/text_field_style.dart';

class UpdateTraining extends StatefulWidget {

 final  TheGymnastic gymnastic;

  UpdateTraining(this.gymnastic);
  @override
  State<StatefulWidget> createState() {
    return UpdateTrainingState(gymnastic);
  }
}

AddSetRepositoryImpl _addSetRepositoryImpl = AddSetRepositoryImpl();

class UpdateTrainingState extends State<UpdateTraining> {

  TheGymnastic gymnastic;
  UpdateTrainingState(this.gymnastic);

  final _formKey = GlobalKey<FormState>();

  final _addSetUseCase = AddSetUseCase(_addSetRepositoryImpl);
  int _weight = 0;
  int _repetition = 0;

  @override
  Widget build(BuildContext context) {

    final _idOfWorkout = context.watch<ChangeNotifierGrabIdOfWorkout>().getData;
    final _sets = context.watch<List<TheSet>>();

    return GestureDetector(
      onTap: () {
        context
            .read<ChangeNotifierHideFloatingButton>()
            .isFloatingButtonHide(false);
        Navigator.of(context).pop();
      },
      onVerticalDragEnd: (DragEndDetails details) {
        context
            .read<ChangeNotifierHideFloatingButton>()
            .isFloatingButtonHide(false);
        Navigator.of(context).pop();
      },
      behavior: HitTestBehavior.opaque,
      child: DraggableScrollableSheet(
          minChildSize: 0.6,
          initialChildSize: 0.8,
          builder: (BuildContext context, controller) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40), bottom: Radius.circular(40)),
                color: Color.fromRGBO(238,238,238, 1),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    Text(gymnastic.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                        Row(
                      children: [
                            Expanded(
                                flex: 2,
                                child: TextFormField(
                                  validator: (val) => val!.isEmpty ? S.of(context).AddWeight: null,
                                  onChanged: (weight) => _weight = int.parse(weight),
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  decoration: TextFieldStyle(S.of(context).Weight, '', Icon(Icons.addchart)).style(),)),
                        Expanded(
                            flex: 1,
                            child: IconButton(onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                _addSetUseCase.addSet(weight: _weight, repetition: _repetition, gymnasticId: gymnastic.id, idOfWorkout: _idOfWorkout);
                              }
                            }, icon: Icon(Icons.add_circle_rounded, size: 50,))),
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              validator: (val) => val!.isEmpty ? S.of(context).AddRepetitions: null,
                              onChanged: (repetition) => _repetition = int.parse(repetition),
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              decoration: TextFieldStyle(S.of(context).Repetitions, '', Icon(Icons.article_outlined)).style(),)),
                      ]
                    ),
                    SizedBox(height: 30,),
                    AnimationLimiter(
                      child: Container(
                        height: 400,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          itemCount: _sets.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SetsTile(_sets[index]);
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
