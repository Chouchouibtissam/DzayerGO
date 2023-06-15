
/*import 'package:cloud_firestore/cloud_firestore.dart';

class LieuService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late final db = FirebaseDatabase.instance.ref();

  //Getting data from collection
  getLieux() async {
    List<Plant> _plantList = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'users').doc(user.uid).collection('Plants').get().then((value) {
      value.docs.forEach((element) {
        Plant plant = Plant.fromMap(element.data());
        _plantList.add(plant);
      });
      return value;
    });
  }
}*/