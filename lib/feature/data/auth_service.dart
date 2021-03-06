import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/entities/the_user.dart';
import 'firestore_service.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Создание объекта пользователя
  _userFromFireBAseUser(User? user_fire_base) {
    return user_fire_base != null ? TheUser(uid: user_fire_base.uid) : null;
  }

  // Метод авторизации пользователя анонимно
  Future singInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user_fire_base = result.user;
      return _userFromFireBAseUser(user_fire_base);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// геттер для стрима читающего изменения авторизован пользователь или нет
  Stream<TheUser?> get user {
    return _auth.authStateChanges().map((user) => _userFromFireBAseUser(user));
  }

  //Метод логаута
  Future logOutUser() async {
    try {
      return await _auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  //метод регитрации пользователя по  email и паролю
  Future registrationByEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // добавление в бд записи с программами тренировок с уникальным id пользователя
      await DatabaseService.user(uid: user!.uid).updateUserData(userEmail: email);
      return _userFromFireBAseUser(user);
    } catch (e) {
      print('Вот она ошибка $e');
      return null;
    }
  }

//метод авторизации пользователя по email и паролю
  Future logInByEmailAndLogin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
