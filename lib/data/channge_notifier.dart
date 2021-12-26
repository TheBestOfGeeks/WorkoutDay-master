import 'package:flutter/widgets.dart';

  class DataChangeNotifier with ChangeNotifier {
   String _dataIdOfExercise = 'error';
   String get getData => _dataIdOfExercise;

   void changeIdOfExercise(String dataIdOfExercise) {
    _dataIdOfExercise = dataIdOfExercise;
    notifyListeners();
   }
  }



