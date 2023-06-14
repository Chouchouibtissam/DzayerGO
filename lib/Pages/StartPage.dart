import 'package:dzayergo/Style/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/mybutton.dart';
import 'LoginScreen.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget dotPageView() {
    return Builder(builder: ((context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
              (index) => dotIndicator(index),
        ),
      );
    }));
  }

  int currentPage = 0;
  //Controller
  final PageController _pagecontroller = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: (index == currentPage) ? 35 : 10,
      //width=12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        //shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PageView(
        controller: _pagecontroller,
        onPageChanged: (value){
          setState(() {
            currentPage = value;
          });
        },
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 300),
                Center( child: Image.asset('assets/images/DzayerGO.png'),),
                Text(
                  'Uncover the magic of Algeria',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.deliusSwashCaps(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox( height: 70,),
                MyButton(label:'découvrez', height: SizeConfig.blockSizeH! *12, width: SizeConfig.blockSizeH! *40, size: SizeConfig.blockSizeH! *5,hasBeenPressed: false, onTap: ()=> Get.to(Login())),
                const SizedBox(height: 50,),
                dotPageView(),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_2.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 300),
                Image.asset('assets/images/DzayerGO.png'),
                Text(
                  'Découvrez les merveilles de\f notre beau pays',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.deliusSwashCaps(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox( height: 40,),
                MyButton(label:'découvrez', height: SizeConfig.blockSizeH! *12, width: SizeConfig.blockSizeH! *40, size: SizeConfig.blockSizeH! *5,hasBeenPressed: false, onTap: ()=> Get.to(Login())),
                const SizedBox(height: 50,),
                dotPageView(),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_3.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 300),
                Image.asset('assets/images/DzayerGO.png'),
                Text(
                  'Explorez un monde de voyages\f virtuels',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.deliusSwashCaps(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox( height: 40,),
                MyButton(label:'découvrez', height: SizeConfig.blockSizeH! *12, width: SizeConfig.blockSizeH! *40, size: SizeConfig.blockSizeH! *5,hasBeenPressed: false, onTap: ()=> Get.to(Login())),
                const SizedBox(height: 50,),
                dotPageView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
