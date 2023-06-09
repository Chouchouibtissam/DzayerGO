
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dzayergo/Models/LieuModel.dart';

import '../Services/Lieu_Service.dart';

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MaterialStateProperty<Color?>? iconColor=  MaterialStateProperty.all(Color(0xff461A3E));
  ScrollController _controller =ScrollController();
  Key _key= Key('');
  List<Lieu> _lieuList = <Lieu>[];
  LieuService lieuservice = LieuService();
  List<String> _ratings=['4,2','3,9','4,8','4,5'];
  @override
  void initState() {
    super.initState();
    initialiseListLieu();
  }
  initialiseListLieu () async{
    _lieuList = await lieuservice.getLieux();
    print('i am supposed to come first');
    print(_lieuList.length);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: const Icon(Icons.account_circle),
                  iconSize: 50,
                  color: Color(0xff461A3E),
                  onPressed: ()=>{},
                );
              },
            ),
          ),
          title:  Text(
            'Bienvenue Amine!',
            style: TextStyle(
              color: Color(0xff461A3E),
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 25),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff461A3E),
              ),
              child: IconButton(
                onPressed: ()=>{},
                icon: const Icon(Icons.settings),
                iconSize: 30,
                color: const Color(0xffffffff),
                splashRadius: 10,
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 150,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 35),
            child: Column(
              children: [
                Title(color: Color(0xff461A3E),
                    child: Text(
                        'Quelle est votre destination préférée ?',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF7956)
                        )
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 45, top: 20, bottom: 20),
                  padding: EdgeInsets.only(left: 25, right: 10),
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0x608b5486),
                  ),
                  child:
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Rechercher un lieu à visiter',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: Color(0xff461A3E),
                    ),
                  ),

                ),
                Text(
                  'Explorer les meilleurs Endroits',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:<Widget> [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color(0xffFF7956),
                        ),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/Vector.png'),
                              color: Color(0xffffffff),
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Populaire',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color(0xffC93A41),
                        ),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/category.png'),
                              color: Color(0xffffffff),
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Categorie',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color(0xff461A3E),
                        ),
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/Vector6.png'),
                              color: Color(0xffffffff),
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Thème',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    key: _key,
                    itemCount: _lieuList.length,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 250,
                          child: GestureDetector(
                            child: Container(
                              height:250,
                              width: 200,
                              margin: EdgeInsets.only(right: 20, bottom: 15, top: 25, left: 5),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image(
                                      image: AssetImage(_lieuList.elementAt(index).Photo),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    _lieuList.elementAt(index).Nom_Lieu!,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.place_outlined,
                                          color: Color(0xff461A3E)
                                      ),
                                      Container(
                                        width: 50,
                                        child: Text(
                                          _lieuList.elementAt(index).Region!,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins().fontFamily,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 60,),
                                      Icon(Icons.star,
                                          color: Colors.black
                                      ),
                                      Text(
                                          _ratings.elementAt(index%4)
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                      );
                    },

                  ),
                ),
                Text(
                  'Top destinations',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    key: _key,
                    itemCount: _lieuList.length,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 500,
                          child: GestureDetector(
                            child: Container(
                              height:200,
                              width: 250,
                              margin: EdgeInsets.only(right: 20, bottom: 6, top: 25, left: 5),
                              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    )
                                  ]
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: Image(
                                      image: AssetImage('assets/Casbah.png'),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        width: 100,
                                        child: Text(
                                          softWrap: true,
                                          _lieuList[index].Nom_Lieu!,
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins().fontFamily,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.place_outlined,
                                              color: Color(0xff461A3E)
                                          ),
                                          Text(
                                            _lieuList.elementAt(index).Region!,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.poppins().fontFamily,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.black
                                          ),
                                          Text(
                                              _ratings.elementAt(index%4)
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                      );
                    },
                  ),
                ),
                SizedBox(height: 60,)
              ],
            ),

          ),
        )
    );
  }
}