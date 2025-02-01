import 'package:flutter/material.dart';
// import 'package:location/location.dart';
import 'package:mon_compagnon/models/cite_model.dart';
import 'package:image_picker/image_picker.dart';

class CiteViewModel extends ChangeNotifier {
  final CiteModel _cite = CiteModel(
    id: '1',
    nom: 'La Citadelle',
    description: 'Une belle cité universitaire',
    lieu: 'PK19',
    localisation: '48.8566, 2.3522',
  );
  final ImagePicker _picker = ImagePicker();
  CiteModel get cite => _cite;
  bool _isEditing = false;
  bool get isEditing => _isEditing;

  void toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void setName(String name) {
    _cite.nom = name;
    notifyListeners();
  }

  void setDescription(String description) {
    _cite.description = description;
    notifyListeners();
  }

  void setPlace(String place) {
    _cite.lieu = place;
    notifyListeners();
  }

  // Future<void> setLocation() async {
    // Location location = Location();

  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   LocationData locationData;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   locationData = await location.getLocation();
  //   _cite.localisation = '${locationData.latitude}, ${locationData.longitude}';
  //   // print('${locationData.latitude}, ${locationData.longitude}');
  //   notifyListeners();
  // }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _cite.imageUrl = pickedFile.path;
      notifyListeners();
    }
  }

  void saveCity() {
    // Implémenter la logique de sauvegarde ici
    _isEditing = false;
    notifyListeners();
  }

  void cancelEdit() {
    // Restaurer les valeurs originales ou autre logique de restauration
    _isEditing = false;
    notifyListeners();
  }

  void deleteCity(BuildContext context) {
    // Implémenter la logique de suppression ici
    Navigator.pop(context); // Fermer le dialogue de confirmation
  }
}
