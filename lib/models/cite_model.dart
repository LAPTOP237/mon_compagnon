class CiteModel {
  String id;
  String nom;
  String description;
  String lieu;
  String localisation;
  String imageUrl;

  CiteModel({
    required this.id,
    required this.nom,
    required this.description,
    required this.lieu,
    required this.localisation,
    this.imageUrl = 'assets/logo.png',
  });

  get location => null;
}
