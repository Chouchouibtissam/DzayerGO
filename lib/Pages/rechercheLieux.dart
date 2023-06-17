

import 'package:dzayergo/Pages/mapinteractive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RechercheLieu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 35,right: 35,top: 55,bottom: 10),
            padding: EdgeInsets.only(left: 15,top: 30),
            height: 140,
            width: 340,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/Category_Arch_Caracalla.png'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Tebessa',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 27,
                    color: Color(0xffFFFFFF)
                  )
                ),
                Row(
                  children: [
                    Icon(
                        Icons.place,
                      color: Color(0xffFFFFFF),
                      size: 20,
                    ),
                    Text(
                        'Rue Chikh Larbi Tebessi',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xffFFFFFF)
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27,right: 27),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/Vector1.png'),
                  size: 50,
                ),
                Text(
                  'Consultez la map intéractive',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff000000)
                        )
                    )
              ],
            ),
          ),
          GestureDetector(
            onTap: ()=>Get.to(MapInteractive()),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
              height: 165,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/MapAlgeria.png'),
                      fit: BoxFit.cover
                  )
              ),

            ),
          ),
          GestureDetector(
            child: Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 5,top: 10,bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 110,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                        image: DecorationImage(
                            image: AssetImage('assets/PointInteret.png'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width : 100,
                          child: Text(
                              softWrap: true,
                              'Choisir un point d’interêts',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xffFFFFFF)
                              )
                          ),
                        ),

                        Icon(
                          Icons.place,
                          color: Colors.white ,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 35,top: 10,bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 110,
                    width: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        image: DecorationImage(
                            image: AssetImage('assets/Event.png'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width : 100,
                          child: Text(
                              softWrap: true,
                              'Voir les évenements à venir',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xffFFFFFF)
                              )
                          ),
                        ),

                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white ,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              height: 165,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/Circuit.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width : 245,
                        child: Text(
                          'Choisir un circuit à suivre',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xffFFFFFF)
                            )
                        ),
                      ),
                      SizedBox(
                        width: 245,
                        child: Text(
                          'vous pouvez choisir un circuit de randonnée parmi une sélection variée et le partager'
                              ' facilement avec vos amis. Explorez notre catalogue de circuits de randonnée !',
                            softWrap: true,
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Color(0xffFFFFFF)
                            )
                        ),
                      )
                    ],
                  ),
                  ImageIcon(
                    AssetImage('assets/circuit2.png'),
                    size: 60,
                    color: Colors.white,
                  )
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}