import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final Widget widget;
  final String nameOfButton;

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState(widget, nameOfButton);

  CustomFloatingActionButton(this.widget, this.nameOfButton);
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  final String _nameOfButton;
  final Widget _widget;

  _CustomFloatingActionButtonState(this._widget, this._nameOfButton);



  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    return _showFab ? FloatingActionButton.extended(

      label: Text(_nameOfButton),
      onPressed: () {
        var bottomSheetController = showBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return _widget;
            }
        );
        showFloatingActionButton(false);
        bottomSheetController.closed.then((value) {
          showFloatingActionButton(true);
        });
      },
    ) : Container();
  }

  void showFloatingActionButton(bool value) {
    setState(() {
      _showFab = value;
    });
  }
}