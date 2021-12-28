import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/presentation/features/custom_floating_action_button.dart';

import '../models/add_program.dart';
import '../models/list_of_programs.dart';

class ProgramsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActionButton(AddProgram(false), 'Добавить программу'),
        body: ListOfProgramsPage(),
      );

  }
}


