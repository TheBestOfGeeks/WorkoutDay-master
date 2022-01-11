import 'package:flutter/widgets.dart';

class ChangeNotifierGrabIdOfGymnastic with ChangeNotifier {
  String _dataIdOfGymnastic = 'error';
  String get getData => _dataIdOfGymnastic;

  void changeIdOfGymnastic(String dataIdOfGymnastic) {
    _dataIdOfGymnastic = dataIdOfGymnastic;
    notifyListeners();
  }
}