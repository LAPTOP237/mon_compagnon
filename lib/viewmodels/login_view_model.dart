import 'package:flutter/material.dart';
import 'package:mon_compagnon/models/login_model.dart';
import 'package:mon_compagnon/services/api_services.dart';
import 'package:mon_compagnon/utils/session_manager.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginModel _loginModel =
      LoginModel(login: '', password: '', rememberMe: true);

  String get login => _loginModel.login;
  String get password => _loginModel.password;
  bool get rememberMe => _loginModel.rememberMe;

  String _message = ''; // Message à afficher
  String get message => _message;

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

  Future<void> submitForm(BuildContext context) async {
    if (_loginModel.login.isNotEmpty && _loginModel.password.isNotEmpty) {
      if (await ApiService.login(_loginModel.login, _loginModel.password)) {
        _message = 'Connexion réussie';
        await Future.delayed(const Duration(seconds: 1));
        //
        await SessionManager.saveSession('username', _loginModel.login);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context,
            '/cite'); // Action à effectuer lors de la soumission du formulaire
      } else {
        _message = 'Une erreur s\'est produite lors de la connexion';
      }
    } else {
      _message = 'Veuillez remplir tous les champs';
    }

    notifyListeners(); // Notifier les écouteurs du changement de l'état
  }
}
