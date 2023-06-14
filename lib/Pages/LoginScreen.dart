import 'package:dzayergo/Models/user.dart';
import 'package:dzayergo/Pages/SignUp.dart';
import 'package:dzayergo/Services/authentification_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// LOGIN SCREEN
class Login extends StatefulWidget {
  const Login({Key? key, this.onTap}) : super(key: key);
  final Function() ? onTap;

  @override
  State<Login> createState() => _LoginState();
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
            return "Please Enter Your Email";
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return "Please Enter a valid email";
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
          hintStyle: GoogleFonts.montserrat(
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
            return "Password is required for login";
          }
          if (!regex.hasMatch(value)) {
            return "Enter Valid Password (Min. 6 Characters)";
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

Widget buildFrogotPass() {
  return Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: () => print('Mot de passe oublié'),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Mot de passe oublié',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xefFF5243),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildLoginBtn(context,Future loginEmailPassword,GlobalKey<FormState> key) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
    width: 250,
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
        'Se connecter',
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildSignUp(context) {
  Size size = MediaQuery.of(context).size;

  return Container(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
    width: 250,
    child: ElevatedButton(
      onPressed: () => {
        const Signup()
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xffC93A41), // Change the button color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Change the border radius here
        ),
      ),
      child: Text(
        'S\'inscrire',
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
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

Widget _buildSignInWithText(context) {
  Size size= MediaQuery.of(context).size;
  return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height*0.01),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '--------------------',
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: -1,
            ),
          ),
          Text(
            'Vous avez pas un compte',
            style: GoogleFonts.montserrat(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '---------------------',
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: -1,
            ),
          ),
        ],
      )
  );
}




class _LoginState extends State<Login> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // string for displaying the error Message
  String? errorMessage;

  //editing controller
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
        /*width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "img/tropical-background.png"
                )
            )
        ),*/
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
                          buildEmail(context,emailController),
                          SizedBox(height: size.height*0.01),
                          buildPassword(passwordController),
                          buildFrogotPass(),
                          buildLoginBtn(context,userModel.seConnecter(emailController.text, passwordController.text, context),_formKey),
                          SizedBox(height: size.height*0.01),
                          _buildSignInWithText(context),
                          //loginUI(),
                          Padding(
                            padding:EdgeInsets.only(bottom: size.height*0.0015,top:size.height*0.002),
                            child: buildSignUp(context),
                          ),
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

