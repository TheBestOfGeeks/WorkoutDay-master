import 'package:flutter/material.dart';
import 'package:workoutday/presentation/models/add_workout.dart';

class CustomFloatingActionButton extends StatefulWidget {
  Widget widget;
  String nameOfButton;

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState(widget, nameOfButton);

  CustomFloatingActionButton(this.widget, this.nameOfButton);
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  final String _nameOfButton;
  final Widget _widget;

  _CustomFloatingActionButtonState(this._widget, this._nameOfButton);



  bool showFab = true;

  @override
  Widget build(BuildContext context) {
    return showFab ? FloatingActionButton.extended(

      label: Text(_nameOfButton),
      onPressed: () {
        var bottomSheetController = showBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return _widget;
            }
        );
        showFoatingActionButton(false);
        bottomSheetController.closed.then((value) {
          showFoatingActionButton(true);
        });
      },
    ) : Container();
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}