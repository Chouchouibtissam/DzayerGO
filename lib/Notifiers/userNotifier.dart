import 'package:dzayergo/Models/user.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier with ChangeNotifier {
  late UserModel _currentuser = UserModel();


  UserModel get currentuser => _currentuser;

  set currentuser (UserModel userModel) {
    _currentuser = userModel;
    notifyListeners();
  }

}