import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:workoutday/core/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'package:workoutday/core/domain/entities/entities/the_gymnastic.dart';
import 'package:workoutday/core/presentation/features/text_field_style.dart';
import 'package:workoutday/core/presentation/training_page/sets_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class UpdateTraining extends StatefulWidget {

  TheGymnastic gymnastic;

  UpdateTraining(this.gymnastic);
  @override
  State<StatefulWidget> createState() {
    return UpdateTrainingState(gymnastic);
  }
}

class UpdateTrainingState extends State<UpdateTraining> {

  TheGymnastic gymnastic;

  UpdateTrainingState(this.gymnastic);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () {
        context
            .read<ChangeNotifierHideFloatingButton>()
            .isFloatingButtonHide(false);
        Navigator.of(context).pop();
      },
      onVerticalDragEnd: (DragEndDetails details) {
        context
            .read<ChangeNotifierHideFloatingButton>()
            .isFloatingButtonHide(false);
        Navigator.of(context).pop();
      },
      behavior: HitTestBehavior.opaque,
      child: DraggableScrollableSheet(
          minChildSize: 0.6,
          initialChildSize: 0.8,
          builder: (BuildContext context, controller) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40), bottom: Radius.circular(40)),
                color: Color.fromRGBO(238, 238, 238, 1),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                child: ListView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    Text(gymnastic.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                        Row(
                      children: [
                            Expanded(
                                flex: 2,
                                child: TextField(
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  decoration: TextFieldStyle('Вес', 'Кг', Icon(Icons.addchart)).style(),)),
                        Expanded(
                            flex: 1,
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_rounded, size: 50,))),
                        Expanded(
                            flex: 2,
                            child: TextField(
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              decoration: TextFieldStyle('Повторы', '', Icon(Icons.article_outlined)).style(),)),
                      ]
                    ),
                    SizedBox(height: 20,),
                    AnimationLimiter(
                      child: Container(
                        height: 400,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return SetsTile();
                          },

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
