

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/domain/entities/the_program.dart';
import 'package:workoutday/presentation/features/text_field_style.dart';

class AddWorkout extends StatefulWidget {
  @override
  AddWorkoutState createState() => AddWorkoutState();
}


class AddWorkoutState extends State<AddWorkout> {
  @override
  Widget build(BuildContext context) {

    final _programs = Provider.of<List<TheProgram>>(context);
    String? _recentProgram;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                child: ListView(
                  children: [
                    DropdownButtonFormField(
                        decoration: TextFieldStyle('Тренировка', 'Название тренировки', Icon(Icons.add)).style(),
                        icon: Icon(Icons.arrow_drop_down_sharp, size: 30),
                          items: _programs.map((program){
             return DropdownMenuItem(
              value: program,
              child: Text("${program.name}"),
              );
              }).toList(),
                        onChanged: (val) => setState(() =>val = _recentProgram),
                      ),

                  ]
                )
              )
          );
        },
      ),
    );
  }
}