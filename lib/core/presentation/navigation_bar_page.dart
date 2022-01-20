import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfSet.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/domain/entities/entities/the_set.dart';
import '../data/firestore_service.dart';
import '../domain/entities/entities/the_exercise.dart';
import '../domain/entities/entities/the_program.dart';
import '../domain/entities/entities/the_workout.dart';
import 'programs_page/programs_page.dart';
import 'settings_page/settings_page.dart';
import 'workouts_page/workouts_page.dart';




class CustomNavigationBar extends StatefulWidget {
  @override
  State<CustomNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<CustomNavigationBar> {
  int index = 0;

  final screens = [
    SafeArea(child:
    Navigator(
      pages: [
        MaterialPage(child: WorkoutsPage()),
      ],
      onPopPage: (route, result){
        return route.didPop(result);
      },
    ),

    ),
    SafeArea(child: ProgramsPage()),
    SafeArea(child: SettingsPage()),
  ];

  @override
  Widget build(BuildContext context) {


    // Мультипровайдер позволяет создать несколько провайдеров слушающих изменения в бд
    return MultiProvider(
      providers: [
        StreamProvider<List<TheProgram>?>(create: (_) => DatabaseService.empty().programs, initialData: null, lazy: false,),
        StreamProvider<List<TheWorkout>?>(create: (_) => DatabaseService.empty().workouts, initialData: null, lazy: false,),
        StreamProvider<List<TheExercise>?>.value(value: DatabaseService.exercises(programId: context.watch<ChangeNotifierGrabIdOfProgram>().getData).exercises, initialData: null, lazy: false,),
    StreamProvider<List<TheGymnastic>?>.value(value: DatabaseService.gymnastics(workoutId:  context.watch<ChangeNotifierGrabIdOfWorkout>().getData).gymnastic, initialData: null, lazy: false,),
        StreamProvider<List<TheSet>?>.value(value: DatabaseService.sets(workoutId: context.watch<ChangeNotifierGrabIdOfWorkout>().getData, gymnasticId: context.watch<ChangeNotifierGrabIdOfGymnastic>().getData ).sets, initialData: null, lazy: false,),
      ],
     child: Scaffold(
       bottomNavigationBar: CurvedNavigationBar(
         backgroundColor: Colors.transparent,
         buttonBackgroundColor: Colors.red,
         animationDuration:  Duration(milliseconds: 300),
         color: Color.fromRGBO(153,153,153, 1),
         height: 60,
         index: index,
         items: <Widget>[
           const Icon(CupertinoIcons.book, color: Colors.white, size: 30,),
           const Icon(CupertinoIcons.waveform_path_ecg, color: Colors.white, size: 30,),
           const Icon(CupertinoIcons.settings, color: Colors.white, size: 30,),
         ],
         onTap: (i) =>  setState(() => index = i),
          ),
       body: screens[index],
    ),
    );

  }
}


