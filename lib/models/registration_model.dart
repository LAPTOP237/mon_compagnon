class RegistrationModel {
  String email;
  String login;
  String password;
  String confirmPassword;

  RegistrationModel(
      {required this.email,
      required this.login,
      required this.password,
      required this.confirmPassword});
}
