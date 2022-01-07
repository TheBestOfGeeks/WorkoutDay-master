import 'package:flutter/widgets.dart';

class ChangeNotifierGrabIdOfWorkout with ChangeNotifier {
  String _dataIdOfWorkout = 'error';
  String get getData => _dataIdOfWorkout;

  void changeIdOfWorkout(String dataIdOfWorkout) {
    _dataIdOfWorkout = dataIdOfWorkout;
    notifyListeners();
  }
}

