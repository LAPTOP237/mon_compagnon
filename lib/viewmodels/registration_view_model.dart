import 'package:flutter/material.dart';
import '../models/registration_model.dart'; // Importez votre modèle

class RegistrationViewModel extends ChangeNotifier {
  final RegistrationModel _registrationModel = RegistrationModel(
      email: '',
      login: '',
      password: '',
      confirmPassword: '',
      acceptTerms: false);

  String get email => _registrationModel.email;
  String get login => _registrationModel.login;
  String get password => _registrationModel.password;
  String get confirmPassword => _registrationModel.confirmPassword;
  bool get acceptTerms => _registrationModel.acceptTerms;

  void setEmail(String value) {
    _registrationModel.email = value;
    notifyListeners();
  }

  void setLogin(String value) {
    _registrationModel.login = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _registrationModel.password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _registrationModel.confirmPassword = value;
    notifyListeners();
  }

  void setAcceptTerms(bool value) {
    _registrationModel.acceptTerms = value;
    notifyListeners();
  }

  void submitForm() {
    // Logique de validation et d'envoi du formulaire
    if (_registrationModel.email.isNotEmpty &&
        _registrationModel.login.isNotEmpty &&
        _registrationModel.password.isNotEmpty &&
        _registrationModel.confirmPassword.isNotEmpty) {
      // Envoyer les données au serveur, etc.
      //print('Formulaire soumis');
    } else {
      // print('Veuillez remplir tous les champs');
    }
  }
}
