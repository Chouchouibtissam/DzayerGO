
import 'package:dzayergo/Services/authentification_firebase_service.dart';
import 'package:flutter/cupertino.dart';


//User model
class UserModel {
  String? uid;
  String? Name;
  String? email;
  String? Password;
  String? PhotoProfile;
  bool? isConnected;
  //Constructor
  UserModel({this.uid,this.Name,this.email,this.Password,this.PhotoProfile,this.isConnected});

//Getting data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      Name: map['Name'],
      email: map['email'],
      Password: map['Password'],
      PhotoProfile: map['PhotoProfile'],
      isConnected: map['isConnected'],
    );
  }
// Sending data to our server
  Map<String, dynamic> toMap()
  {
    return {
      'uid': uid,
      'Name': Name,
      'email': email,
      'Password':Password,
      'PhotoProfile':PhotoProfile,
      'isConnected':isConnected,

    };
  }
//Getting the authentication Service
  authenticationService authService = authenticationService();

// Méthode pour se connecter
  Future seConnecter(String email, String password, BuildContext context) async{
    authService.loginUsingEmailPassword(email, password, context);
  }

}
