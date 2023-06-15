import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dzayergo/Models/LieuModel.dart';

class Event extends StatefulWidget {
  const Event ({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  final MaterialStateProperty<Color?>? iconColor=  MaterialStateProperty.all(const Color(0xff461A3E));
  final ScrollController _controller =ScrollController();
  final Key _key= Key('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 50,
                  color: const Color(0xff461A3E),
                  onPressed: ()=>{},
                );
              },
            ),
          ),
          title:  Text(
            'Les évenements à venir',
            style: TextStyle(
              color: const Color(0xff461A3E),
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 150,
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 35),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 45, top: 20, bottom: 20),
                  padding: const EdgeInsets.only(left: 25, right: 10),
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0x608b5486),
                  ),
                  child:
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Chercher un évenement',
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
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    key: _key,
                    itemCount: Lieux.length,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 250,
                          child: GestureDetector(
                            child: Container(
                              height:300,
                              width: 200,
                              margin: const EdgeInsets.only(right: 20, bottom: 15, top: 25, left: 5),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: Colors.white,
                                  boxShadow: const [
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
                                  Material(
                                    //elevation:5,
                                    color: Colors.transparent,
                                    child: Image(
                                      image: AssetImage(Lieux[index].Photo),
                                    ),
                                  ),
                                  Text(
                                    Lieux[index].Nom_Lieu!,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.place_outlined,
                                          color: Color(0xff461A3E)
                                      ),
                                      Text(
                                        'El-Oued',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.poppins().fontFamily,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      const Icon(Icons.star,color: Colors.black),
                                      const Text('4.2')
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
              ],
            ),
          ),
        )
    );
  }
}
