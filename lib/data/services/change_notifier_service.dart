import 'package:flutter/widgets.dart';

  class DataChangeNotifierService with ChangeNotifier {
   String _dataIdOfExercise = 'error';
   String get getData => _dataIdOfExercise;

   void changeIdOfExercise(String dataIdOfExercise) {
    _dataIdOfExercise = dataIdOfExercise;
    notifyListeners();
   }
  }



