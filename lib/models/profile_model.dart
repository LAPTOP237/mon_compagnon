class ProfileModel {
  String profileImageUrl;
  String fullName;
  String email;
  String whatsapp;
  String contact;
  String login;
  String password;
  bool isVerified;

  ProfileModel({
    required this.profileImageUrl,
    required this.fullName,
    required this.email,
    required this.whatsapp,
    required this.contact,
    required this.login,
    required this.password,
    this.isVerified = false,
  });
}
