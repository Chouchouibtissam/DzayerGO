import 'package:dzayergo/Models/user.dart';
import 'package:dzayergo/Services/authentification_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}
Widget buildName(BuildContext context, TextEditingController _NameController) {
  Size size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: size.height * 0.02),
      TextFormField(
        autofocus: false,
        controller: _NameController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez saisir votre Nom";
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return "Veuillez entrer un Nom valide";
          }
          return null;
        },
        onSaved: (value) {
          _NameController.text = value!;
        },
        style: const TextStyle(color: Colors.black87),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white, // Change the outline color to white
              width: 1, // Adjust the outline width as needed
            ),
          ),
          fillColor: Colors.white, // Change the background color to white
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xffc93a41),
          ),
          hintText: 'Name',
          hintStyle: GoogleFonts.poppins(
            color: Color(0x99461a3e),
          ),
        ),
      ),
    ],
  );
}
Widget buildEmail(BuildContext context, TextEditingController _emailController) {
  Size size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: size.height * 0.02),
      TextFormField(
        autofocus: false,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez saisir votre adresse e-mail";
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return "Veuillez entrer une adresse e-mail valide";
          }
          return null;
        },
        onSaved: (value) {
          _emailController.text = value!;
        },
        style: const TextStyle(color: Colors.black87),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white, // Change the outline color to white
              width: 1, // Adjust the outline width as needed
            ),
          ),
          fillColor: Colors.white, // Change the background color to white
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xffc93a41),
          ),
          hintText: 'E-mail',
          hintStyle: GoogleFonts.poppins(
            color: Color(0x99461a3e),
          ),
        ),
      ),
    ],
  );
}
Widget buildPassword(TextEditingController _passwordController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 10),
      TextFormField(
        autofocus: false,
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return "Le mot de passe est requis pour la connexion";
          }
          if (!regex.hasMatch(value)) {
            return "Veuillez entrer un mot de passe valide (minimum 6 caractères)";
          }
          return null;
        },
        onSaved: (value) {
          _passwordController.text = value!;
        },
        style: TextStyle(color: Colors.black87),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white, // Change the outline color to white
              width: 1, // Adjust the outline width as needed
            ),
          ),
          fillColor: Colors.white, // Change the background color to white
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: const Icon(
            Icons.lock,
            color: Color(0xffC93A41),
          ),
          hintText: 'Mot de passe',
          hintStyle: GoogleFonts.poppins(
            color: const Color(0x99461a3e),
          ),
        ),
      ),
    ],
  );
}
Widget buildSignUpBtn(context,Future loginEmailPassword,GlobalKey<FormState> key) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
    width: 250,
    height: 60,
    child: ElevatedButton(
      onPressed: () {
        //test the app
        if(key.currentState!.validate()){
          loginEmailPassword;
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xffFF5243), // Change the button color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Change the border radius here
        ),
      ),
      child: Text(
        'S\'inscrire',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
Widget insertLogo(context){
  Size size = MediaQuery.of(context).size;
  return Column(
    children:<Widget> [
      Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
          child:Image(
            image: AssetImage(
                "assets/images/DzayerGO_logo.png"
            ),
            height: size.height*0.25,
            width: 225,
          )
      ),
    ],
  );
}

class _SignupState extends State<Signup> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // string for displaying the error Message
  String? errorMessage;

  //editing controller
  final NameController = TextEditingController();
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  //Authentication service
  authenticationService authService = authenticationService();

  //Creating a new userModel
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Container(
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Form(
                  key: _formKey,
                  child:  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: size.height*0.065),
                          insertLogo(context),
                          SizedBox(height: size.height*0.06),
                          buildName(context, NameController),

                          buildEmail(context,emailController),
                          SizedBox(height: size.height*0.01),
                          buildPassword(passwordController),
                          SizedBox(height: size.height*0.05),
                          buildSignUpBtn(context,userModel.seConnecter(emailController.text, passwordController.text, context),_formKey),
                          SizedBox(height: size.height*0.01),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
