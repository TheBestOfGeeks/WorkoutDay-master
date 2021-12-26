

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/domain/entities/the_program.dart';
import 'package:workoutday/presentation/models/programs_tile.dart';



class ListOfProgramsPage extends StatefulWidget {




  @override
  State<StatefulWidget> createState() {
return ListOfProgramsPageState();
  }
}

class ListOfProgramsPageState extends State<ListOfProgramsPage> {

  @override
   Widget build(BuildContext context) {

    final programs  = Provider.of<List<TheProgram>?>(context) ?? [];
    return
      ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          return ProgramsTile(programs[index]);
        },

      );
  }
}

