import 'package:flutter/material.dart';
import '../models/login_model.dart'; // Importez votre modèle

class LoginViewModel extends ChangeNotifier {
  final LoginModel _loginModel = LoginModel(login: '', password: '');

  String get login => _loginModel.login;
  String get password => _loginModel.password;

  void setLogin(String value) {
    _loginModel.login = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _loginModel.password = value;
    notifyListeners();
  }

  void submitForm() {
    // Logique de validation et d'envoi du formulaire
    if (_loginModel.login.isNotEmpty && _loginModel.password.isNotEmpty) {
      // Envoyer les données au serveur, etc.
      print('Formulaire soumis');
    } else {
      print('Veuillez remplir tous les champs');
    }
  }
}
