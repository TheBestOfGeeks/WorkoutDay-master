import 'package:flutter/widgets.dart';

  class ChangeNotifierGrabIdOfProgram with ChangeNotifier {
   String _dataIdOfProgram = 'error';
   String get getData => _dataIdOfProgram;

   void changeIdOfProgram(String dataIdOfProgram) {
    _dataIdOfProgram = dataIdOfProgram;
    notifyListeners();
   }
  }



