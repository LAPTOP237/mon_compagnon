import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mon_compagnon/models/validation_request_model.dart';

class ValidationRequestViewModel extends ChangeNotifier {
  final ValidationRequestModel _request;
  final ImagePicker _picker = ImagePicker();

  ValidationRequestViewModel()
      : _request = ValidationRequestModel(
          fullName: '',
          dateOfBirth: DateTime.now(),
        );

  ValidationRequestModel get request => _request;

  void setFullName(String fullName) {
    _request.fullName = fullName;
    notifyListeners();
  }

  void setDateOfBirth(DateTime dateOfBirth) {
    _request.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  Future<void> pickFrontCniImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _request.frontCniImage = pickedFile.path;
      notifyListeners();
    }
  }

  Future<void> pickBackCniImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _request.backCniImage = pickedFile.path;
      notifyListeners();
    }
  }

  Future<void> pickCityDocument() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _request.cityDocument = pickedFile.path;
      notifyListeners();
    }
  }

  void setIsCityManager(bool isCityManager) {
    _request.isCityManager = isCityManager;
    notifyListeners();
  }

  void submitRequest() {
    // Implémenter la logique de soumission de la demande de validation ici
    // Par exemple, envoyer les données à un serveur
  }
}
