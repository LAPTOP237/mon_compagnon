class ChambreModel {
  String id;
  String nom;
  String description;
  double prix;
  int niveau;
  bool estEquipe;
  bool estLibre;
  String imageUrl;

  ChambreModel(
      {required this.id,
      required this.nom,
      required this.description,
      required this.prix,
      required this.niveau,
      this.estEquipe = false,
      this.estLibre = true,
      this.imageUrl = 'assets/logo.png'});
}
