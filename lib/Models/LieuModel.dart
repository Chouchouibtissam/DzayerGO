class Lieu {
  String? ID_Lieu;
  String? Nom_Lieu;
  String? Hor_Ouv;
  String? Prix_Acc;
  String Photo;
  Lieu({this.ID_Lieu,this.Nom_Lieu,this.Hor_Ouv,this.Prix_Acc,required this.Photo});
}

List<Lieu> Lieux = [

  Lieu(
      ID_Lieu: '2',
      Nom_Lieu: 'Notre dame',
      Hor_Ouv: '09:00',
      Prix_Acc: 'Gratuit',
      Photo: 'assets/NotreDame.png'
  ),
  Lieu(
      ID_Lieu: '3',
      Nom_Lieu: 'Gazelle d''Or',
      Hor_Ouv: '09:00',
      Prix_Acc: 'Gratuit',
      Photo: 'assets/Sahra.png'
  )
];