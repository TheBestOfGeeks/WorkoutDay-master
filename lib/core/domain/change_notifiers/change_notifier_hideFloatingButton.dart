


import 'package:flutter/cupertino.dart';

class ChangeNotifierHideFloatingButton extends ChangeNotifier {
  bool _isHide = false;

  bool get getHideOrNotButton {
    return _isHide;
  }

  isFloatingButtonHide(bool isHide) {
    _isHide = isHide;
    notifyListeners();
  }

}