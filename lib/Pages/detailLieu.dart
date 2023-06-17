import 'package:dzayergo/Pages/mapinteractive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailLieu extends StatefulWidget {
  final String photo;
  final String name;
  final String Region;
  final int i;

  const DetailLieu({Key? key, required this.photo,required  this.name,required this.Region,required this.i }) : super(key: key);
  @override
  State<DetailLieu> createState() => _DetailLieu();
}

class _DetailLieu extends State<DetailLieu> {
  bool _moreTextTapped = false;
  String comm = '';
  List<String> _commentaire = [
    'Trés belle vue, Vous devez surement la visiter!',
    'Quelle magnifique lieu',
    'J' 'aime bien! Je reviendrais certainement'
  ];
  List<String> _ratings=['4,2','3,9','4,8','4,5'];
  List<String> _transports=['Taxi','Metro','Bus','Tram'];
  List<String> _Hotels=['El-Azi','AZ','Laurassi','idkwhat'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => {Get.to(MapInteractive())},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffFFFFFF),
                  width: 3.5,
                ),
                color: Color(0xff461A3E)),
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xffFFFFFF),
              size: 30,
            ),
          ),
        ),
        leadingWidth: 100,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 46,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffFFFFFF),
                  width: 3.5,
                ),
                color: Color(0xff461A3E)),
            child: Icon(
              Icons.favorite_outline,
              color: Color(0xffFFFFFF),
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              height: 410,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.photo),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                widget.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Color(0xff461A3E),
                  ),
                  Text(
                    widget.Region,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 60,
                    margin:
                        EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                          )
                        ]),
                    child: Icon(
                      Icons.star,
                      color: Color(0xff461A3E),
                      size: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        _ratings.elementAt(widget.i),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 60,
                    margin:
                        EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                          )
                        ]),
                    child: Icon(
                      Icons.directions_bus,
                      color: Color(0xff461A3E),
                      size: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Transport',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        _transports.elementAt(widget.i),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 5),
                    width: 60,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: ImageIcon(
                      AssetImage('assets/circuit2.png'),
                      color: Color(0xff461A3E),
                      size: 30,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Distance',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '20Km',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 5),
                    width: 60,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.apartment_outlined,
                      color: Color(0xff461A3E),
                      size: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hotel',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                          _Hotels.elementAt(widget.i),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                'Description',
                style: TextStyle(
                    color: Color(0xff461A3E),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, bottom: 5, right: 10),
              child: Text(
                'La basilique est perchée sur une colline appelée "le plateau de Puy-en-Velay" qui offre une vue panoramique sur la baie Alger et la Méditerranée. Elle a été construite entre 1858 et 1872 dans un style néo-byzantin et néo-mauresque, '
                'fusionnant des influences architecturales européennes et nord-africaines.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 340, bottom: 10),
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                    text: 'Voir plus ..',
                    style: TextStyle(
                      color: Color(0xff461A3E),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _moreTextTapped = !_moreTextTapped;
                        });
                      }),
              ),
            ),
            _moreTextTapped
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, bottom: 5),
                        child: Text(
                          'Commentaire',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xff461A3E),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        height: _commentaire.length * 110,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _commentaire.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    left: 17, bottom: 10, top: 5, right: 17),
                                padding: EdgeInsets.only(left: 20, top: 5),
                                height: 90,
                                width: 340,
                                decoration: BoxDecoration(
                                    color: Color(0x1a461a3e),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff461A3E),
                                              width: 3.5,
                                            ),
                                            //color: Color(0xff461A3E)
                                          ),
                                          child: Icon(
                                            Icons.account_circle,
                                            color: Color(0xffFFFFFF),
                                            size: 30,
                                          ),
                                        ),
                                        Text(
                                          'Amine',
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _commentaire.elementAt(index),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 170),
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star_outlined,
                                                color: Color(0xff461A3E),
                                              ),
                                              Icon(
                                                Icons.star_outlined,
                                                color: Color(0xff461A3E),
                                              ),
                                              Icon(
                                                Icons.star_outlined,
                                                color: Color(0xff461A3E),
                                              ),
                                              Icon(
                                                Icons.star_outlined,
                                                color: Color(0xff461A3E),
                                              ),
                                              Icon(
                                                Icons.star_outline,
                                                color: Color(0x3d461a3e),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Donner votre avis',
                          style: TextStyle(
                            color: Color(0xff461a3e),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 33, right: 15, bottom: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 100,
                        width: 340,
                        decoration: BoxDecoration(
                            color: Color(0x1a461a3e),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xff461A3E), width: 1.0)),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Ajouter un commentaire ...',
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Color(0xC4000000)
                                ),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (value){
                                setState(() {
                                  comm = value;
                                });
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                  onPressed: ()=>{
                                    _commentaire.add(comm)
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xffFF5243)),
                                      elevation: MaterialStateProperty.all(0),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ))
                                  ),
                                  child: Text(
                                    'Ajouter',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: Color(0xffFFFFFF)
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Container(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
              width: 350,
              child: ElevatedButton(
                  onPressed: ()=>{},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xffC93A41)),
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
                    minimumSize: MaterialStateProperty.all(Size(50, 50))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'Voir Histoire',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xffFFFFFF)
                        ),
                      )
                    ],
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
