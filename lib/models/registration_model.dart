class RegistrationModel {
  String email;
  String login;
  String password;
  String confirmPassword;
  bool acceptTerms;

  RegistrationModel(
      {required this.email,
      required this.login,
      required this.password,
      required this.confirmPassword,
      required this.acceptTerms});
}
