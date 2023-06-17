class Lieu {
  String? ID_Lieu;
  String? Nom_Lieu;
  String? Catgorie;
  String? Theme;
  String? Region;
  String? Hor_Ouv;
  String? Prix_Acc;
  String Photo;
  double Latitude;
  double Longitude;
  Lieu({this.ID_Lieu,this.Nom_Lieu,this.Catgorie,this.Theme,this.Region,this.Hor_Ouv,this.Prix_Acc,required this.Photo, required this.Latitude,required this.Longitude});

  //Getting Event details from server
  factory Lieu.fromMap(Map<String, dynamic> map) {
    return Lieu(
      Nom_Lieu: map['Nom'],
      Catgorie: map['Categorie'],
      Theme: map['Theme'],
      Region: map['Region'],
      Hor_Ouv: map['HorOuv'],
      Prix_Acc: map['PrixAcc'],
      Photo: map['Photo'],
      Latitude: map['Latitude'],
      Longitude: map ['Longitude'],
    );
  }
}

