import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/add_program.dart';
import 'models/list_of_programs.dart';

class ProgramsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  void _programSettingPanel() {
    showModalBottomSheet(context: context,
       isScrollControlled: true,
       backgroundColor: Colors.transparent,
       builder: (BuildContext context) {
         return AddProgram(false);
       }
    );
  }


    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _programSettingPanel(),
          icon: Icon(Icons.add),
          label: Text('Добавить'),
        ),
        body: ListOfProgramsPage(),
      );

  }
}


