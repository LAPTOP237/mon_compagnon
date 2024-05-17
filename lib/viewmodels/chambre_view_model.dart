import 'package:flutter/material.dart';
import 'package:mon_compagnon/models/chambre_model.dart';
import 'package:image_picker/image_picker.dart';

class ChambreViewModel extends ChangeNotifier {
  final ChambreModel _room = ChambreModel(
    id: '1',
    nom: 'Chambre 167',
    description: 'Une chambre confortable',
    prix: 50.0,
    niveau: 1,
    estEquipe: true,
    estLibre: true,
  );
  final ImagePicker _picker = ImagePicker();
  ChambreModel get room => _room;
  bool _isEditing = false;
  bool get isEditing => _isEditing;

  void toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void setNom(String nom) {
    _room.nom = nom;
    notifyListeners();
  }

  void setDescription(String description) {
    _room.description = description;
    notifyListeners();
  }

  void setPrix(String prix) {
    _room.prix = double.tryParse(prix) ?? 0.0;
    notifyListeners();
  }

  void setNiveau(int niveau) {
    _room.niveau = niveau;
    notifyListeners();
  }

  void toggleEstEquipe(bool estEquipe) {
    _room.estEquipe = estEquipe;
    notifyListeners();
  }

  void toggleEstLibre(bool estLibre) {
    _room.estLibre = estLibre;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _room.imageUrl = pickedFile.path;
      notifyListeners();
    }
  }

  void saveRoom() {
    // Implémenter la logique de sauvegarde ici
    _isEditing = false;
    notifyListeners();
  }

  void cancelEdit() {
    // Restaurer les valeurs originales ou autre logique de restauration
    _isEditing = false;
    notifyListeners();
  }

  void deleteRoom(BuildContext context) {
    // Implémenter la logique de suppression ici
    Navigator.pop(context); // Fermer le dialogue de confirmation
  }
}
