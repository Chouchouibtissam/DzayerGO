import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dzayergo/Models/LieuModel.dart';


class LieuService{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //Getting data from collection
  Future<List<Lieu>> getLieux() async {
    List<Lieu> _LieuList = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Lieu').get().then((value) {
      value.docs.forEach((element) {
        Lieu lieu = Lieu.fromMap(element.data());
        _LieuList.add(lieu);
      });
      return value;
    });
    return _LieuList;
  }
}