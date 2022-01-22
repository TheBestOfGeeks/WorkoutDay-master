

import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/feature/presentation/programs_page/programs_tile.dart';

import '../../domain/entities/entities/the_program.dart';





class ListOfPrograms extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
return ListOfProgramsState();
  }
}

class ListOfProgramsState extends State<ListOfPrograms> {

  @override
   Widget build(BuildContext context) {

    final programs  = Provider.of<List<TheProgram>?>(context) ?? [];
    return
      AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: programs.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: SlideAnimation(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: -300,
                  verticalOffset: -850,
                  child: ProgramTile(programs[index]),
                ),
              ),
            );
          },

        ),
      );
  }
}
