
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/data/channge_notifier.dart';
import 'package:workoutday/domain/entities/the_user.dart';
import 'package:workoutday/presentation/login_page.dart';
import 'package:workoutday/presentation/navigation_bar_page.dart';
import 'package:workoutday/data/auth_service.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      lazy: false,
      value: AuthService().user,
      initialData: null,
      child: CupertinoApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current_user = Provider.of<TheUser?>(context);
    if (current_user == null) {
      return LoginPage();
    }  else {
      return ChangeNotifierProvider<DataChangeNotifier>(create: (context) => DataChangeNotifier(),
     child: NavigationBar(),
    );
    }
  }

}

//ChangeNotifierProvider<DataChangeNotifier>(create: (context) => DataChangeNotifier(),),
