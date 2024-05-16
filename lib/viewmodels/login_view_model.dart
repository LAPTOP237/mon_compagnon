import 'package:flutter/material.dart';
import 'package:mon_compagnon/models/login_model.dart';
import 'package:mon_compagnon/utils/session_manager.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginModel _loginModel =
      LoginModel(login: '', password: '', rememberMe: true);

  String get login => _loginModel.login;
  String get password => _loginModel.password;
  bool get rememberMe => _loginModel.rememberMe;

  void setLogin(String value) {
    _loginModel.login = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _loginModel.password = value;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _loginModel.rememberMe = value;
    notifyListeners();
  }

  Future<void> submitForm() async {
    // Logique de validation et d'envoi du formulaire
    if (_loginModel.login.isNotEmpty && _loginModel.password.isNotEmpty) {
      // Envoyer les données au serveur, etc.
      await SessionManager.saveSession('username', 'LINJOUOM');
      // Redirection vers une autre page
      
      // print('Formulaire soumis');
    } else {
      // print('Veuillez remplir tous les champs');
    }
  }
}
