class ValidationRequestModel {
  String fullName;
  DateTime dateOfBirth;
  String frontCniImage;
  String backCniImage;
  String cityDocument;
  bool isCityManager;

  ValidationRequestModel({
    required this.fullName,
    required this.dateOfBirth,
    this.frontCniImage = 'assets/fond1.png',
    this.backCniImage = 'assets/fond1.png',
    this.cityDocument = 'assets/fond1.png',
    this.isCityManager = false,
  });
}
