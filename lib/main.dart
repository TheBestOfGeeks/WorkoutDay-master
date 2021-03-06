import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '/generated/l10n.dart';
import 'feature/data/auth_service.dart';
import 'feature/domain/change_notifiers/change_notifier_grabIdOfProgram.dart';
import 'feature/domain/change_notifiers/change_notifier_grabIdOfSet.dart';
import 'feature/domain/change_notifiers/change_notifier_grabIdOfWorkout.dart';
import 'feature/domain/change_notifiers/change_notifier_hideFloatingButton.dart';
import 'feature/domain/entities/the_user.dart';
import 'feature/presentation/authentication_page/login_page.dart';
import 'feature/presentation/features/theme.dart';
import 'feature/presentation/navigation_bar_page.dart';


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
    } else {
      return MultiProvider(providers: [
        ChangeNotifierProvider<ChangeNotifierGrabIdOfWorkout>(
            create: (context) => ChangeNotifierGrabIdOfWorkout()),
        ChangeNotifierProvider<ChangeNotifierGrabIdOfProgram>(
            create: (context) => ChangeNotifierGrabIdOfProgram()),
        ChangeNotifierProvider<ChangeNotifierHideFloatingButton>(
            create: (context) => ChangeNotifierHideFloatingButton()),
        ChangeNotifierProvider<ChangeNotifierGrabIdOfGymnastic>(
          create: (context) => ChangeNotifierGrabIdOfGymnastic(),
        )
      ], child: CustomNavigationBar());
    }
  }
}
