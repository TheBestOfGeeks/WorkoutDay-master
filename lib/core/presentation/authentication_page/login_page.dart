import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workoutday/core/data/auth_service.dart';
import 'package:workoutday/core/presentation/authentication_page/registration_page.dart';
import 'package:workoutday/core/presentation/features/loading.dart';
import 'package:workoutday/core/presentation/features/text_field_style.dart';
import 'package:workoutday/generated/l10n.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService(); // объект класса AuthService
  final _formKey = GlobalKey<FormState>();
  bool _loadingAnimation = false;
  bool _hidePass = true;
  String _email = '';
  String _password = '';
  String _loginError = '';


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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loadingAnimation ? Loading() : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: (Text(S.of(context).Authorization)),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Image(
                image: AssetImage('lib/assets/images/d.png'),
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              // Поле ввода Email для входа
              TextFormField(
                validator: (val) => val!.isEmpty ? S.of(context).EmailHintText : null,
                onChanged: (val){
                  setState(() {
                    _email = val;
                  });
                },
                decoration: TextFieldStyle(S.of(context).LogInTextField, S.of(context).LoginHintText, Icon(Icons.person), suffixIcon: Icon(Icons.delete_outline, color: Colors.red,),).style(),
              ),
              SizedBox(
                height: 20,
              ),
              // Поле ввода пароля для входа
              TextFormField(
                obscureText: _hidePass,
                validator: (val) => val!.isEmpty ? S.of(context).PasswordHintText : null,
                onChanged: (val){
                  setState(() {
                    _password = val;
                  });
                },
                decoration: TextFieldStyle(S.of(context).PasswordTextField, S.of(context).PasswordHintText, Icon(Icons.password), suffixIcon: _passIconButton()).style(),
              ),
              Text(_loginError,
              style: TextStyle(color: Colors.red, fontSize: 18),),
              // Кнопка Войти
              ButtonBar(
                alignment: MainAxisAlignment.center,
                overflowButtonSpacing: 5,
                children: [
                  CupertinoButton(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.blue,
                    child: Text(
                      S.of(context).LogInBTN,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        setState(() => _loadingAnimation = true);
                        dynamic result = await _auth.logInByEmailAndLogin(_email, _password);
                        if (result == null){
                          setState(() {
                            _loadingAnimation = false;
                            _loginError = S.of(context).ErrorLoginOrPassword;
                          });
                        }
                      }
                    },
                  ),
                  //Кнопка регистрации
                  CupertinoButton(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.blue,
                    child: Text(S.of(context).RegistrationBTN),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage())),
                    },
                  ),
                  //Кнопка войти анонимно
                  CupertinoButton(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Text(S.of(context).AnonEnter),
                      color: Colors.blue,
                      onPressed: (() async {
                       await _auth.singInAnon();
                      })),
                ],
              )
            ],
          ),
        ));
  }
}
