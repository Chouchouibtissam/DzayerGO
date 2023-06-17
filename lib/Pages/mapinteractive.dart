import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:dzayergo/Pages/detailLieu.dart';
import 'package:dzayergo/Pages/rechercheLieux.dart';
import 'package:dzayergo/Pages/visiteVirtuelle.dart';
import 'package:dzayergo/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

import '../Models/LieuModel.dart';
import '../Services/Lieu_Service.dart';
import 'Home.dart';
import 'favoris.dart';
import 'notification.dart';

class MapInteractive extends StatefulWidget {
  const MapInteractive({Key? key}) : super(key: key);
  @override
  State<MapInteractive> createState() => _MapInteractive();
}

class _MapInteractive extends State<MapInteractive> {
  Set<Marker> _markers = <Marker>{};
  Set<Marker> _markersAll = <Marker>{};
  List<Lieu> _lieuList = <Lieu>[];
  LieuService lieuservice = LieuService();
  List<String> Filtre = ['Categorie', 'Theme'];
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //initialiseListLieu();
    _addMarkers();
  }

  Future<ui.Image> getImageFromPath(String imagePath) async {
    ByteData byteData = await rootBundle.load(imagePath);
    List<int> bytes = byteData.buffer.asUint8List();
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/${imagePath.split('/').last}');
    await file.writeAsBytes(bytes);
    File imageFile = file;
    Uint8List imageBytes = imageFile.readAsBytesSync();

    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  Future<BitmapDescriptor> getMarkerIcon(String imagePath, Size size) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint tagPaint = Paint()..color = Colors.green;
    final double tagWidth = 40.0;

    final Paint shadowPaint = Paint()..color = Colors.green.withAlpha(100);
    final double shadowWidth = 15.0;

    final Paint borderPaint = Paint()..color = Colors.transparent;
    final double borderWidth = 3.0;

    final double imageOffset = shadowWidth + borderWidth;

    // Add shadow circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
            0.0,
            0.0,
            size.width,
            size.height,
          ),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth,
              size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    // Oval for the image
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await getImageFromPath(
        imagePath); // Alternatively use your own method to get the image
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.cover);

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? uint8List = byteData?.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List!);
  }

  _addMarkers() async {
    Marker marker1;
    _lieuList = await lieuservice.getLieux();
    for (int i = 0; i < _lieuList.length; i++) {
      marker1 = Marker(
        markerId: MarkerId(_lieuList[i].Nom_Lieu!),
        position: LatLng(_lieuList[i].Latitude, _lieuList[i].Longitude),
        icon: await getMarkerIcon(_lieuList[i].Photo, Size(250.0, 250.0)),
        onTap: () => Get.to(DetailLieu(photo: _lieuList[i].Photo, name: _lieuList[i].Nom_Lieu!, Region: _lieuList[i].Region!, i: (i % 4),)),
      );
      setState(() {
        _markersAll.add(marker1);
      });
    }
    setState(() {
      _markers.addAll(_markersAll);
      print('these are my elements');
      print(_markers.length);
    });
  }

  late GoogleMapController mapController;
  bool iconFilterPressed = false;
  GlobalKey _NavKey = GlobalKey();
  List PagesAll = [];

  var myindex = 0;
  @override
  Widget build(BuildContext context) {
    PagesAll.add(RechercheLieu());
    PagesAll.add(VisiteVirtuelle());
    PagesAll.add(Home());
    PagesAll.add(Favoris());
    PagesAll.add(Notifications());
    return Material(
      child:  Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(children: <Widget>[
            Scaffold(
              extendBody: true,
              bottomNavigationBar: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: ui.Color(0xff461A3E),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      key: _NavKey,
                      onTap: (index) {
                        setState(() {
                          myindex = index;
                          Get.to(MainScreen());
                        });
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage('assets/Vector1.png'),
                              color: ui.Color(0xffffffff),
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage('assets/Vector2.png'),
                              color: ui.Color(0xffffffff),
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage('assets/Vector3.png'),
                              color: ui.Color(0xffffffff),
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage('assets/Vector4.png'),
                              color: ui.Color(0xffffffff),
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage('assets/Vector5.png'),
                              color: ui.Color(0xffffffff),
                              size: 30,
                            ),
                            label: ''),
                      ],
                    ),
                  )),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(36.737232, 3.086472), zoom: 15),
                      onMapCreated: _onMapCreated,
                      markers: _markers,
                    ),
                  ),
                ]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 45, right: 45, top: 70, bottom: 20),
                  padding: EdgeInsets.only(left: 25, right: 10),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: ui.Color(0xffD3C3D0),
                      border: Border.all(color: ui.Color(0xff461A3E))),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher un lieu à visiter',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        suffixIconColor: ui.Color(0xff461A3E),
                      ),
                      controller: _textEditingController,
                      onSubmitted: (value) {
                        _onResearch(_textEditingController.text);
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ui.Color(0xff461A3E),
                  ),
                  //alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: _onFilterButtonPressed,
                    icon: Icon(
                      Icons.filter_alt_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                iconFilterPressed
                    ?  Container(
                          height: 120,
                          width: 150,
                          margin: EdgeInsets.only(left: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: ui.Color(0xff461A3E),
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: ui.Color(0xff461A3E),
                                ),
                                child: ExpansionTile(
                                  collapsedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)
                                    ),
                                    backgroundColor: ui.Color(0xff461A3E),
                                    collapsedBackgroundColor: ui.Color(0xff461A3E),
                                    title: Text(Filtre[index]),
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 60,
                                        child: ListTile(
                                          tileColor: ui.Color(0xff461A3E),
                                          selectedTileColor: ui.Color(0xff461A3E),
                                          title: index == 0
                                              ? Text('Monument')
                                              : Text('Nature'),
                                          onTap: () => {
                                            index == 0
                                                ? _onFilterSelected(
                                                    'Monument', index)
                                                : _onFilterSelected(
                                                    'Nature', index)
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 60,
                                        child: ListTile(
                                          tileColor: ui.Color(0xff461A3E),
                                          selectedTileColor: ui.Color(0xff461A3E),
                                          title: index == 0
                                              ? Text('Musée')
                                              : Text('Histoire'),
                                          onTap: () => {
                                            index == 0
                                                ? _onFilterSelected(
                                                    'Musée', index)
                                                : _onFilterSelected(
                                                    'Histoire', index)
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 60,
                                        child: ListTile(
                                          tileColor: ui.Color(0xff461A3E),
                                          selectedTileColor: ui.Color(0xff461A3E),
                                          title: index == 0
                                              ? Text('Parc')
                                              : Text('Loisirs'),
                                          onTap: () => {
                                            index == 0
                                                ? _onFilterSelected('Parc', index)
                                                : _onFilterSelected(
                                                    'Loisirs', index)
                                          },
                                        ),
                                      ),
                                    ]),
                              );
                            },
                          ),
                        )
                    : Container(),
              ],
            ),
          ]),
        ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onFilterButtonPressed() {
    setState(() {
      iconFilterPressed = !iconFilterPressed;
      _markers.addAll(_markersAll);
    });
  }

  void _onFilterSelected(String selectedFilter, int i) {
    Set<Marker> markerToBeRemoved = <Marker>{};
    if (i == 0 && iconFilterPressed) {
      //Filtrage par catégorie
      for (int j = 0; j < _lieuList.length; j++) {
        if (_lieuList.elementAt(j).Catgorie != selectedFilter) {
          setState(() {
            markerToBeRemoved.add(_markers.elementAt(j));
          });
        }
      }
      _markers.removeAll(markerToBeRemoved);
    } else if (i == 1 && iconFilterPressed) {
      //Filtrage par thème
      for (int j = 0; j < _lieuList.length; j++) {
        if (_lieuList.elementAt(j).Theme != selectedFilter) {
          setState(() {
            markerToBeRemoved.add(_markers.elementAt(j));
          });
        }
      }
      _markers.removeAll(markerToBeRemoved);
    }
  }

  _onResearch(String RegionSearched) {
    Set<Marker> _markerToBeRemoved = <Marker>{};
    print('This is the full markers list');
    print(_markersAll.length);
    print('This is the markers list');
    print(_markers.length);
    for (int j = 0; j < _lieuList.length; j++) {
      if (_lieuList.elementAt(j).Region != RegionSearched) {
        setState(() {
          _markerToBeRemoved.add(_markers.elementAt(j));
        });
      }
    }
    _markers.removeAll(_markerToBeRemoved);
  }
}
