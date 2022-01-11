import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/data/auth_service.dart';
import 'package:workoutday/core/presentation/features/text_field_style.dart';
import 'package:workoutday/generated/l10n.dart';


class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationPageState();
  }
}

class RegistrationPageState extends State<RegistrationPage> {
  String email = '';
  String password = '';
  AuthService _auth = AuthService();
  bool _hidePass = true;
  late String registrationError;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    registrationError = '';
    super.initState();
  }

// Возвращает widget кликабельной иконки для пароля(меняет скрытый пароль на видимый)
  _passIconButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            _hidePass = !_hidePass;
          });
        },
        icon: Icon(
          _hidePass ? Icons.visibility : Icons.visibility_off,
          color: _hidePass ? Colors.black : Colors.red,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(
                  height: 100,
                ),
                // Текст ошибки
                Text(
                  registrationError,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToLastDescent: true),
                ),
// Поле ввода Email
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? S.of(context).EmailHintText : null,
                  onChanged: (emailVal) {
                    setState(() {
                      email = emailVal;
                    });
                  },
                  decoration: TextFieldStyle(S.of(context).EmailTextField, S.of(context).EmailHintText, Icon(Icons.email),
                    suffixIcon: IconButton(onPressed: (){
                    }, icon: Icon(Icons.delete_outline), color: Colors.red,)
                  ).style(),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Поле ввода пароля
                TextFormField(
                  validator: (val) =>
                      val!.length < 6 ? S.of(context).PasswordHintText : null,
                  onChanged: (passwordVal) {
                    setState(() {
                      password = passwordVal;
                    });
                  },
                  maxLength: 20,
                  obscureText: _hidePass,
                  decoration: TextFieldStyle(S.of(context).PasswordTextField,
                          S.of(context).PasswordHintText, Icon(Icons.password),
                          suffixIcon: _passIconButton())
                      .style(),
                ),
                SizedBox(
                  height: 20,
                ),
                // Поле повторного ввода пароля
                TextFormField(
                  maxLength: 20,
                  obscureText: _hidePass,
                  decoration: TextFieldStyle(
                          S.of(context).PasswordHintText,
                          S.of(context).PasswordRepeatHintText,
                          Icon(Icons.password),
                          suffixIcon: _passIconButton())
                      .style(),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  overflowButtonSpacing: 5,
                  children: [
                    // Кнопка регистрации
                    CupertinoButton(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.blue,
                      child: Text(S.of(context).RegistrationBTN),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth
                              .registrationByEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              registrationError = S.of(context).CheckIfTheInputDataIsRight;
                            });
                          } else {
                            ////
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                    // Кнопка назад
                    CupertinoButton(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.blue,
                      child: Text(S.of(context).BackBTN),
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                    ),
                  ],
                )
              ],
            )));
  }
} // закрывает класс
