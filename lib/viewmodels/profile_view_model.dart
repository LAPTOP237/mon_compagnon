import 'package:flutter/material.dart';
import 'package:mon_compagnon/models/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileModel _profile = ProfileModel(
    profileImageUrl: 'assets/profile.png',
    fullName: 'LINJOUOM ALAIN PASCAL',
    email: 'linjouom9@gmail.com',
    whatsapp: '+237696855129',
    contact: '+237694828353',
    login: 'Laptop237',
    password: 'password123',
    isVerified: true,
  );

  bool _isEditMode = false;
  String _oldPassword = '';
  String _confirmPassword = '';

  ProfileModel get profile => _profile;
  bool get isEditMode => _isEditMode;
  String get oldPassword => _oldPassword;
  String get confirmPassword => _confirmPassword;

  void toggleEditMode() {
    _isEditMode = !_isEditMode;
    notifyListeners();
  }

  void setFullName(String fullName) {
    _profile.fullName = fullName;
    notifyListeners();
  }

  void setEmail(String email) {
    _profile.email = email;
    notifyListeners();
  }

  void setWhatsapp(String whatsapp) {
    _profile.whatsapp = whatsapp;
    notifyListeners();
  }

  void setContact(String contact) {
    _profile.contact = contact;
    notifyListeners();
  }

  void setLogin(String login) {
    _profile.login = login;
    notifyListeners();
  }

  void setPassword(String password) {
    _profile.password = password;
    notifyListeners();
  }

  void setOldPassword(String oldPassword) {
    _oldPassword = oldPassword;
    notifyListeners();
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  void saveChanges() {
    // Implement saving logic here
    toggleEditMode();
  }

  void cancelChanges() {
    toggleEditMode();
  }
}
