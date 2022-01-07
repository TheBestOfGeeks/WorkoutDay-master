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

  /// `Programs`
  String get Programs {
    return Intl.message(
      'Programs',
      name: 'Programs',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
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
  String get LoginRegistratuonHintText {
    return Intl.message(
      'Придумайте логин для входа',
      name: 'LoginRegistratuonHintText',
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

  /// `Введите пароль`
  String get PasswordHintText {
    return Intl.message(
      'Введите пароль',
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
