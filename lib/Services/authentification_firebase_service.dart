import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dzayergo/Models/user.dart';
import 'package:dzayergo/Notifiers/userNotifier.dart';
import 'package:dzayergo/Pages/LoginScreen.dart';
import 'package:dzayergo/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';



class authenticationService{

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance; //Initialising the firebase
  final _auth = FirebaseAuth.instance;

  //Getting the uid of current user
  Future<String?> getCurrentUID ()  async {
    User? user =  _auth.currentUser;
    await user?.reload();
    user =  _auth.currentUser;
    return (await user?.uid);
  }

  //Getting the current User
  Future getCurrentUser() async {
    User? user =  _auth.currentUser;
    await user?.reload();
    user =  _auth.currentUser;
    return (user);
  }

  //Initialising the user and adding it to the users collection
  postDetailsToFireStore(String name, BuildContext context) async {
    //Calling our user model
    User? user= _auth.currentUser;
    UserModel userModel= UserModel();

    //Affecting the values
    userModel.Name = name;
    userModel.uid = user!.uid;
    userModel.email = user!.email;


    //Adding the user to the database
    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");

    //Getting to the Home page
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen(user: user,)), (route) => false);
  }

  //Sign Up using Email & Password
  Future SignUp(String email, String password, String name,BuildContext context) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
      postDetailsToFireStore(name,context),
    } ).catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
    loginUsingEmailPassword(email, password, context);
  }

  //Sign in with Email & Password

  Future loginUsingEmailPassword(String email,String password,BuildContext context) async {
    // string for displaying the error Message
    String errorMessage='Success';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen(user:_auth.currentUser!,))),
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
      }
      Fluttertoast.showToast(msg: errorMessage);
      print(error.code);
    }
  }

  //Getting user in a user model
  getUser(UserNotifier userNotifier, User user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((value) {
      UserModel userModel = UserModel.fromMap(value.data());
      userNotifier.currentuser = userModel ;
    });
  }


  //Login out
  Future logOut() async {
    await _auth.signOut();
    Get.to(Login());
  }


}

