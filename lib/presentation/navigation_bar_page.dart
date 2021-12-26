import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/data/channge_notifier.dart';
import 'package:workoutday/domain/entities/the_exercise.dart';
import 'package:workoutday/domain/entities/the_program.dart';
import 'package:workoutday/generated/l10n.dart';
import 'package:workoutday/presentation/programs_page.dart';
import 'package:workoutday/presentation/settings_page.dart';
import 'package:workoutday/data/database_service.dart';
import 'package:workoutday/presentation/workouts_page.dart';



class NavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Мультипровайдер позволяет читаем создать несколько провайдеров слушающих иизменения в бд
    return MultiProvider(
      providers: [
        StreamProvider<List<TheProgram>?>(create: (_) => DatabaseService().programs, initialData: null, lazy: false,),
        StreamProvider<List<TheExercise>?>.value(value: DatabaseService(programId: context.watch<DataChangeNotifier>().getData).exercises, initialData: null, lazy: false,),
      ],
     child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.book, color: Colors.black),
                label: (S
                    .of(context)
                    .listOfWorkout)),
            BottomNavigationBarItem(
                icon: const Icon(
                    CupertinoIcons.waveform_path_ecg, color: Colors.black),
                label: (S
                    .of(context)
                    .Programs)),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.settings, color: Colors.black,),
                label: (S
                    .of(context)
                    .Settings))
          ]),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              //navigationBar: CupertinoNavigationBar(
              child: Container(
                padding: EdgeInsets.only(bottom: 50) ,
                child: on_pressed(i),
              ),
            );
          },
        );
      },
    ),
    );

  }

  on_pressed(int numOfTab) {
    //метод вызывает класс нижнего раздела в таб баре
    if (numOfTab == 0) {
      return WorkoutsPage();
    } else if (numOfTab == 1) {
      return ProgramsPage();
    } else if (numOfTab == 2) {
      return SettingsPage();
    }
  }
}

