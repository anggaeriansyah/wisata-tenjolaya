// import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wisata_tenjolaya/models/categories_model.dart';

class DestinasiScreen extends StatefulWidget {
  // const DestinasiScreen({Key? key}) : super(key: key);

  final Destinasi destinasi;

  DestinasiScreen({required this.destinasi});

  @override
  _DestinasiScreenState createState() => _DestinasiScreenState();
}

Completer<GoogleMapController> _controller = Completer();

final List<Marker> _marker = [];
String mapTheme = '';

class _DestinasiScreenState extends State<DestinasiScreen> {
  @override
  Widget build(BuildContext context) {
    CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(widget.destinasi.lat, widget.destinasi.long), zoom: 13);
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/retro_theme.json')
        .then((value) {
      mapTheme = value;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            // size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
            // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            widget.destinasi.namaDepan == ''
                ? widget.destinasi.nama
                : widget.destinasi.namaDepan + " " + widget.destinasi.nama),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Container(
                          child: PhotoView(
                            imageProvider: AssetImage(widget.destinasi.image),
                            minScale: PhotoViewComputedScale.contained * 1,
                            maxScale: PhotoViewComputedScale.covered * 1.1,
                          ),
                        )),
              );
            },
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width / 1.2,
                  // width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage(widget.destinasi.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 1.2,
                  // width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.transparent,
                    //     Colors.transparent,
                    //     Colors.black45
                    //   ],
                    // ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       IconButton(
                //         icon: Icon(Icons.arrow_back),
                //         iconSize: 30,
                //         color: Colors.white,
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // Padding(
                      //   padding: EdgeInsets.only(right: 10),
                      //   child: Text(
                      //     widget.destinasi.namaDepan,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 35,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 10),
                      //   child: Text(
                      //     widget.destinasi.nama,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 35,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      GestureDetector(
                        onTap: () {
                          _marker.add(Marker(
                            markerId: MarkerId('value'),
                            position: LatLng(
                                widget.destinasi.lat, widget.destinasi.long),
                          ));
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Maps'),
                              content: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.9,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: GoogleMap(
                                    initialCameraPosition: _kGooglePlex,
                                    markers: Set<Marker>.of(_marker),
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      // _infoWindowController.googleMapController = controller;
                                      controller.setMapStyle(mapTheme);
                                      // _controller.complete(controller);
                                    },
                                  ),
                                ),
                              ),
                              actions: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      primary: Colors.white,
                                      // padding: const EdgeInsets.all(16.0),
                                      textStyle: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _marker.remove(_marker[0]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text('kembali'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white12,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.8,
                          // width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.destinasi.alamat,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    overflow: TextOverflow.fade,
                                  ),
                                  Text(
                                    widget.destinasi.alamatKec,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  // FontAwesomeIcons.locationArrow,
                                  FontAwesomeIcons.locationDot,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ).asGlass(
                          clipBorderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   right: 20,
                //   bottom: 20,
                //   child: Icon(
                //     Icons.location_on_rounded,
                //     color: Colors.white,
                //     size: 35,
                //   ),
                // ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),

          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  // width: 300,
                  decoration: BoxDecoration(
                    color: widget.destinasi.hariOp == 'Tutup Sementara'
                        ? Colors.red
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: -2,
                        color: Colors.black12,
                        // offset: Offset(0, 2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.destinasi.hariOp,
                              style:
                                  widget.destinasi.hariOp == 'Tutup Sementara'
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white)
                                      : TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                            ),
                            SizedBox(height: 4),
                            widget.destinasi.hariOp != 'Tutup Sementara'
                                ? Text(
                                    widget.destinasi.jamOp,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Theme.of(context).accentColor),
                                  )
                                : Icon(
                                    FontAwesomeIcons.rotate,
                                    size: 20,
                                    color: Colors.white70,
                                  )
                          ],
                        ),
                        widget.destinasi.hariOpLainnya != ''
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.destinasi.hariOpLainnya,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  SizedBox(height: 4),
                                  Text(
                                    widget.destinasi.jamOpLainnya,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ],
                              )
                            : widget.destinasi.hariOp == 'Tutup Sementara'
                                ? Icon(
                                    FontAwesomeIcons.solidCalendarDays,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    FontAwesomeIcons.solidCalendarDays,
                                    size: 40,
                                    color: Colors.black38,
                                  )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2.16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -2,
                            color: Colors.black12,
                            // offset: Offset(0, 2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tiket',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Theme.of(context).accentColor),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Rp. ${widget.destinasi.tiket}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2.16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -2,
                            color: Colors.black12,
                            // offset: Offset(0, 2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Camping',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Theme.of(context).accentColor),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  widget.destinasi.camping == true
                                      ? 'Tersedia'
                                      : 'Tidak Tersedia',
                                  style: TextStyle(
                                      // color: widget.destinasi.camping ==
                                      //             'Tersedia' ||
                                      //         widget.destinasi.camping ==
                                      //             'tersedia'
                                      //     ? Colors.green
                                      //     : Theme.of(context).primaryColor,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      overflow: TextOverflow.fade),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      'Deskripsi :',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.destinasi.deskripsi,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Galeri',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.destinasi.imageGalerys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: 250,
                          height: 150,
                          margin: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Container(
                                      child: PhotoView(
                                    imageProvider: AssetImage(
                                        widget.destinasi.imageGalerys[index]),
                                    minScale:
                                        PhotoViewComputedScale.contained * 1,
                                    maxScale:
                                        PhotoViewComputedScale.covered * 1.1,
                                  )

                                      // PhotoViewGallery.builder(
                                      //   itemCount:
                                      //       widget.destinasi.imageGalerys.length,
                                      //   builder: (BuildContext context, int index) {
                                      //     return PhotoViewGalleryPageOptions(
                                      //         imageProvider: AssetImage(widget
                                      //             .destinasi.imageGalerys[index]),
                                      //         heroAttributes:
                                      //             PhotoViewHeroAttributes(
                                      //                 tag: index),
                                      //                 );

                                      //   },
                                      // ),
                                      ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              child: Image(
                                image: AssetImage(
                                    widget.destinasi.imageGalerys[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
