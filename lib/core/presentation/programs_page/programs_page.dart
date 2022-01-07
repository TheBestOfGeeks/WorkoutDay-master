import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/presentation/features/custom_floating_action_button.dart';


import 'add_program.dart';
import 'list_of_programs.dart';

class ProgramsPage extends StatefulWidget {

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {


  @override
  Widget build(BuildContext context) {
    bool _hideFloatingButton = context.watch<ChangeNotifierHideFloatingButton>().getHideOrNotButton;
    return Scaffold(
      appBar: AppBar(
        title: Text('Программы тренировок'),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _hideFloatingButton ? Container() : CustomFloatingActionButton(AddProgram(), 'Добавить программу') ,
        body: ListOfPrograms(),
      );

  }
}

