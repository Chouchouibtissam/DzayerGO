
import 'package:dzayergo/Pages/rechercheLieux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dzayergo/pages/Home.dart';
import 'package:dzayergo/pages/favoris.dart';
import 'package:dzayergo/pages/notification.dart';
import 'package:dzayergo/pages/visiteVirtuelle.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen>{
  GlobalKey _NavKey = GlobalKey();
  List PagesAll=[] ;

  var myindex =0;
  @override
  Widget build(BuildContext context) {
    PagesAll.add(RechercheLieu());
    PagesAll.add(VisiteVirtuelle());
    PagesAll.add(Home());
    PagesAll.add(Favoris());
    PagesAll.add(Notifications());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor:Color(0xff461A3E),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              key: _NavKey,
              onTap: (index){
                setState(() {
                  myindex = index;
                });
              },
              items : const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/Vector1.png'),
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/Vector2.png'),
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/Vector3.png'),
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/Vector4.png'),
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/Vector5.png'),
                      color: Color(0xffffffff),
                      size: 30,
                    ),
                    label: ''
                ),
              ],

            ),
          )
      ),
      body: PagesAll[myindex],
    );
  }
}