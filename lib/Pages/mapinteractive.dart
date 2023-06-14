import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';



class MapInteractive extends StatefulWidget{
  const MapInteractive({Key? key}): super(key:key);
  @override
  State<MapInteractive> createState()=> _MapInteractive();
}

class _MapInteractive extends State<MapInteractive>{
  Set<Marker> _markers = <Marker>{};
  @override
  void initState() {
    super.initState();
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
          Rect.fromLTWH(
              shadowWidth,
              shadowWidth,
              size.width - (shadowWidth * 2),
              size.height - (shadowWidth * 2)
          ),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    // Oval for the image
    Rect oval = Rect.fromLTWH(
        imageOffset,
        imageOffset,
        size.width - (imageOffset * 2),
        size.height - (imageOffset * 2)
    );

    // Add path for oval image
    canvas.clipPath(Path()
      ..addOval(oval));

    // Add image
    ui.Image image = await getImageFromPath(imagePath); // Alternatively use your own method to get the image
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.cover);

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(
        size.width.toInt(),
        size.height.toInt()
    );

    // Convert image to bytes
    final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? uint8List = byteData?.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List!);
  }

  _addMarkers() async {
    Marker marker1 =
    Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(36.737232, 3.086472),
      icon: await getMarkerIcon('assets/Notre_Dame_Afrique.jpg', Size(250.0, 250.0)),
      onTap: ()=>Null,
    );
    Marker marker2 =Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(35.6976541, -0.6337376),
        icon: await getMarkerIcon('assets/NotreDame.png', Size(250.0, 250.0))
    );

    setState(() {
      _markers.add(marker1);
      _markers.add(marker2);
    });
  }

  late GoogleMapController mapController;
  bool iconFilterPressed = false;
  @override
  Widget build (BuildContext context){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Stack(
            children:<Widget>[
              Scaffold(
                body: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(target: LatLng(36.737232, 3.086472), zoom: 15),
                          onMapCreated: _onMapCreated,
                          markers: _markers,
                        ),
                      ),
                    ]
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 45, right: 45, top: 70, bottom: 20),
                    padding: EdgeInsets.only(left: 25, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: ui.Color(0xffD3C3D0),
                        border: Border.all(
                            color: ui.Color(0xff461A3E)
                        )
                    ),
                    child:
                    TextField(
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
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:ui.Color(0xff461A3E),
                    ),
                    //alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed:
                      _onFilterButtonPressed,
                      icon: Icon(
                        Icons.filter_alt_sharp,
                        color: Colors.white,
                      ),

                    ),
                  ),
                  iconFilterPressed ? Container(
                    height: 100,
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text(
                              'Categorie'
                          ),
                        ),
                        ListTile(
                          title: Text(
                              'Theme'
                          ),
                        )
                      ],
                    ),
                  ):Container(),
                ],
              ),
            ]
        ),
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void _onFilterButtonPressed(){
    setState(() {
      iconFilterPressed=!iconFilterPressed;
    });

  }
}

