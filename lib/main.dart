
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:workoutday/data/services/change_notifier_service.dart';
import 'package:workoutday/domain/entities/the_user.dart';
import 'package:workoutday/presentation/features/theme.dart';
import 'package:workoutday/presentation/pages/login_page.dart';
import 'package:workoutday/presentation/pages/navigation_bar_page.dart';
import 'package:workoutday/data/services/auth_service.dart';
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
      child: MaterialApp(
        theme: basicTheme(),
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
      return ChangeNotifierProvider<DataChangeNotifierService>(create: (context) => DataChangeNotifierService(),
     child: NavigationBar(),
    );
    }
  }

}

//ChangeNotifierProvider<DataChangeNotifier>(create: (context) => DataChangeNotifier(),),
