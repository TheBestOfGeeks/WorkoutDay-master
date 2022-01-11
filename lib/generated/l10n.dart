// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `List Of Workouts`
  String get listOfWorkout {
    return Intl.message(
      'List Of Workouts',
      name: 'listOfWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get AppBarRegistrationText {
    return Intl.message(
      'Регистрация',
      name: 'AppBarRegistrationText',
      desc: '',
      args: [],
    );
  }

  /// `Введите Ваше имя`
  String get HintNameOfRegistrationForm {
    return Intl.message(
      'Введите Ваше имя',
      name: 'HintNameOfRegistrationForm',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get LogInBTN {
    return Intl.message(
      'Войти',
      name: 'LogInBTN',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get BackBTN {
    return Intl.message(
      'Назад',
      name: 'BackBTN',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get RegistrationBTN {
    return Intl.message(
      'Регистрация',
      name: 'RegistrationBTN',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get LogInTextField {
    return Intl.message(
      'Email',
      name: 'LogInTextField',
      desc: '',
      args: [],
    );
  }

  /// `Придумайте логин для входа`
  String get LoginRegistrationHintText {
    return Intl.message(
      'Придумайте логин для входа',
      name: 'LoginRegistrationHintText',
      desc: '',
      args: [],
    );
  }

  /// `Логин для входа Ваш email`
  String get LoginHintText {
    return Intl.message(
      'Логин для входа Ваш email',
      name: 'LoginHintText',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get PasswordTextField {
    return Intl.message(
      'Пароль',
      name: 'PasswordTextField',
      desc: '',
      args: [],
    );
  }

  /// `Введите Пароль`
  String get PasswordHintText {
    return Intl.message(
      'Введите Пароль',
      name: 'PasswordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Повторите пароль`
  String get PasswordRepeatHintText {
    return Intl.message(
      'Повторите пароль',
      name: 'PasswordRepeatHintText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get EmailTextField {
    return Intl.message(
      'Email',
      name: 'EmailTextField',
      desc: '',
      args: [],
    );
  }

  /// `Введите Ваш Email`
  String get EmailHintText {
    return Intl.message(
      'Введите Ваш Email',
      name: 'EmailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Добавление новой программы`
  String get AddNewProgramText {
    return Intl.message(
      'Добавление новой программы',
      name: 'AddNewProgramText',
      desc: '',
      args: [],
    );
  }

  /// `Добавление новой программы`
  String get AddNameOfProgramHint {
    return Intl.message(
      'Добавление новой программы',
      name: 'AddNameOfProgramHint',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get Authorization {
    return Intl.message(
      'Авторизация',
      name: 'Authorization',
      desc: '',
      args: [],
    );
  }

  /// `Неверный логин или пароль`
  String get ErrorLoginOrPassword {
    return Intl.message(
      'Неверный логин или пароль',
      name: 'ErrorLoginOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Войти анонимно`
  String get AnonEnter {
    return Intl.message(
      'Войти анонимно',
      name: 'AnonEnter',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте правильность введённых данных`
  String get CheckIfTheInputDataIsRight {
    return Intl.message(
      'Проверьте правильность введённых данных',
      name: 'CheckIfTheInputDataIsRight',
      desc: '',
      args: [],
    );
  }

  /// `Введите имя программы`
  String get EnterProgramName {
    return Intl.message(
      'Введите имя программы',
      name: 'EnterProgramName',
      desc: '',
      args: [],
    );
  }

  /// `Имя программы`
  String get ProgramName {
    return Intl.message(
      'Имя программы',
      name: 'ProgramName',
      desc: '',
      args: [],
    );
  }

  /// `Программа с таким именем уже существует`
  String get NameOfProgramExist {
    return Intl.message(
      'Программа с таким именем уже существует',
      name: 'NameOfProgramExist',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить программу`
  String get SaveProgram {
    return Intl.message(
      'Сохранить программу',
      name: 'SaveProgram',
      desc: '',
      args: [],
    );
  }

  /// `Программы тренировок`
  String get Programs {
    return Intl.message(
      'Программы тренировок',
      name: 'Programs',
      desc: '',
      args: [],
    );
  }

  /// `Добавить программу`
  String get AddProgram {
    return Intl.message(
      'Добавить программу',
      name: 'AddProgram',
      desc: '',
      args: [],
    );
  }

  /// `Упражнение`
  String get Exercise {
    return Intl.message(
      'Упражнение',
      name: 'Exercise',
      desc: '',
      args: [],
    );
  }

  /// `Название упражнения`
  String get NameOfExercise {
    return Intl.message(
      'Название упражнения',
      name: 'NameOfExercise',
      desc: '',
      args: [],
    );
  }

  /// `Сначала сохраните программу`
  String get FirstSaveTheProgram {
    return Intl.message(
      'Сначала сохраните программу',
      name: 'FirstSaveTheProgram',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get Settings {
    return Intl.message(
      'Настройки',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get Exit {
    return Intl.message(
      'Выйти',
      name: 'Exit',
      desc: '',
      args: [],
    );
  }

  /// `Не добавлено ни одной тренировки`
  String get NoOneTrainingIsFound {
    return Intl.message(
      'Не добавлено ни одной тренировки',
      name: 'NoOneTrainingIsFound',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get Add {
    return Intl.message(
      'Добавить',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Вес`
  String get Weight {
    return Intl.message(
      'Вес',
      name: 'Weight',
      desc: '',
      args: [],
    );
  }

  /// `Повторы`
  String get Repetitions {
    return Intl.message(
      'Повторы',
      name: 'Repetitions',
      desc: '',
      args: [],
    );
  }

  /// `Добавить упражнение`
  String get AddExercise {
    return Intl.message(
      'Добавить упражнение',
      name: 'AddExercise',
      desc: '',
      args: [],
    );
  }

  /// `Заполните вес!`
  String get AddWeight {
    return Intl.message(
      'Заполните вес!',
      name: 'AddWeight',
      desc: '',
      args: [],
    );
  }

  /// `Заполните повторения!`
  String get AddRepetitions {
    return Intl.message(
      'Заполните повторения!',
      name: 'AddRepetitions',
      desc: '',
      args: [],
    );
  }

  /// `Начать тренировку`
  String get StartTraining {
    return Intl.message(
      'Начать тренировку',
      name: 'StartTraining',
      desc: '',
      args: [],
    );
  }

  /// `Тренировки`
  String get Trainings {
    return Intl.message(
      'Тренировки',
      name: 'Trainings',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
