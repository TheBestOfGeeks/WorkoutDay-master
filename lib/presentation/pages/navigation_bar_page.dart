import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/data/services/change_notifier_service.dart';
import 'package:workoutday/domain/entities/the_exercise.dart';
import 'package:workoutday/domain/entities/the_program.dart';
import 'package:workoutday/domain/entities/the_workout.dart';
import 'package:workoutday/generated/l10n.dart';
import 'package:workoutday/presentation/pages/programs_page.dart';
import 'package:workoutday/presentation/pages/settings_page.dart';
import 'package:workoutday/data/services/firestore_service.dart';
import 'package:workoutday/presentation/pages/workouts_page.dart';



class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int index = 0;

  final screens = [
    SafeArea(child: WorkoutsPage()),
    SafeArea(child: ProgramsPage()),
    SafeArea(child: SettingsPage()),
  ];

  @override
  Widget build(BuildContext context) {

    // Мультипровайдер позволяет читаем создать несколько провайдеров слушающих иизменения в бд
    return MultiProvider(
      providers: [
        StreamProvider<List<TheProgram>?>(create: (_) => DatabaseService().programs, initialData: null, lazy: false,),
        StreamProvider<List<TheWorkout>?>(create: (_) => DatabaseService().workouts, initialData: null, lazy: false,),
        StreamProvider<List<TheExercise>?>.value(value: DatabaseService(programId: context.watch<DataChangeNotifierService>().getData).exercises, initialData: null, lazy: false,),
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
         onTap: (i) => setState(() => index = i),
          ),
       body: screens[index],
    ),
    );

  }
}


