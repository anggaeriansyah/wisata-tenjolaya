import 'dart:async';
import 'dart:collection';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:ui';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:glass/glass.dart';
import 'package:wisata_tenjolaya/models/categories_model.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  // String stAddress = '', stAdd = '', stName = '';

  static CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(-6.6525547, 106.708000), zoom: 13);

  CustomInfoWindowController _infoWindowController =
      CustomInfoWindowController();

  String mapTheme = '';

  @override
  void initState() {
    super.initState();
    loadData();

    // DefaultAssetBundle.of(context)
    //     .loadString('assets/maptheme/retro_theme.json')
    //     .then((value) {
    //   mapTheme = value;
    // });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = const [
    LatLng(-6.715958, 106.730926),
    LatLng(-6.712839, 106.725821),
    LatLng(-6.706891, 106.720422),
    LatLng(-6.704236, 106.715780),
    LatLng(-6.698845, 106.710584),
    LatLng(-6.697333, 106.708581),
    LatLng(-6.694545, 106.706684),
    LatLng(-6.692586, 106.704864),
    LatLng(-6.691757, 106.702967),
    LatLng(-6.688216, 106.701677),
    LatLng(-6.686736, 106.699764), //curug ciampea
    LatLng(-6.681963, 106.695988),
    LatLng(-6.679024, 106.694471),
    LatLng(-6.671113, 106.698339),
    LatLng(-6.667270, 106.698946),
    LatLng(-6.665235, 106.697960),
    LatLng(-6.664557, 106.696215),
    LatLng(-6.655365, 106.691967),
    LatLng(-6.645795, 106.688857),
    LatLng(-6.633965, 106.687871),
    LatLng(-6.629219, 106.684740),
    LatLng(-6.621204, 106.684367),
    LatLng(-6.618511, 106.687320),
    LatLng(-6.615679, 106.688260),
    LatLng(-6.611984, 106.686924),
    LatLng(-6.609963, 106.687040),
    LatLng(-6.609155, 106.688202),
    LatLng(-6.607654, 106.687912),
    LatLng(-6.603224, 106.689516),
    LatLng(-6.604090, 106.693191), // turn2
    LatLng(-6.606627, 106.694437),
    LatLng(-6.606999, 106.695620),
    LatLng(-6.606484, 106.697133),
    LatLng(-6.605202, 106.697391),
    LatLng(-6.604006, 106.697133),
    LatLng(-6.604006, 106.699714),
    LatLng(-6.601272, 106.701520),
    LatLng(-6.598367, 106.701348),
    LatLng(-6.594351, 106.704187),
    LatLng(-6.589822, 106.708315),
    LatLng(-6.590249, 106.712788),
    LatLng(-6.594094, 106.712874),
    LatLng(-6.595291, 106.711326),
    LatLng(-6.598025, 106.711670),
    LatLng(-6.598879, 106.710552),
    LatLng(-6.601614, 106.710810),
    LatLng(-6.602041, 106.713648),
    LatLng(-6.603664, 106.715369),
    LatLng(-6.604861, 106.715541),
    LatLng(-6.605971, 106.714423),
    LatLng(-6.608279, 106.713906),
    LatLng(-6.609646, 106.712186),
    LatLng(-6.615370, 106.709606),
    LatLng(-6.618703, 106.713132),
    LatLng(-6.621864, 106.713046), //
    LatLng(-6.623915, 106.714681),
    LatLng(-6.626393, 106.714939),
    LatLng(-6.628101, 106.716401),
    LatLng(-6.630152, 106.714939),
    LatLng(-6.630579, 106.711756),
    LatLng(-6.634595, 106.711498),
    LatLng(-6.636902, 106.714078),
    LatLng(-6.643652, 106.716917),
    LatLng(-6.647155, 106.719756),
    LatLng(-6.649974, 106.719670),
    LatLng(-6.652537, 106.721906),
    LatLng(-6.652537, 106.721906),
    LatLng(-6.662277, 106.724314),
    LatLng(-6.667945, 106.725992),
    LatLng(-6.670190, 106.726032),
    LatLng(-6.676116, 106.727022),
    LatLng(-6.678081, 106.728530),
    LatLng(-6.680607, 106.729001),
    LatLng(-6.684163, 106.728624),
    LatLng(-6.685660, 106.729754),
    LatLng(-6.688374, 106.729377),
    LatLng(-6.691929, 106.730320),
    LatLng(-6.693707, 106.729001),
    LatLng(-6.696514, 106.729566),
    LatLng(-6.701379, 106.728059),
    LatLng(-6.702130, 106.731342),
    LatLng(-6.705601, 106.733205),
    LatLng(-6.715349, 106.733612),
  ];

  List<double> lat = [];
  List<double> long = [];
  List img = [];
  List namaDepan = [];
  List nama = [];

  final List<Marker> _markers = [];

  loadData() async {
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/retro_theme.json')
        .then((value) {
      mapTheme = value;
    });

    // LatLong
    for (int i = 0; i < categories.first.airTerjun.length; i++) {
      lat.add(categories.first.airTerjun[i].lat);
    }
    for (int i = 0; i < categories.first.airTerjun.length; i++) {
      long.add(categories.first.airTerjun[i].long);
    }

    for (int i = 0; i < categories.first.rekreasi.length; i++) {
      lat.add(categories.first.rekreasi[i].lat);
    }
    for (int i = 0; i < categories.first.rekreasi.length; i++) {
      long.add(categories.first.rekreasi[i].long);
    }

    // Gambar
    for (int i = 0; i < categories.first.airTerjun.length; i++) {
      img.add(categories.first.airTerjun[i].image);
    }
    for (int i = 0; i < categories.first.rekreasi.length; i++) {
      img.add(categories.first.rekreasi[i].image);
    }

    // Nama Depan
    for (int i = 0; i < categories.first.airTerjun.length; i++) {
      namaDepan.add(categories.first.airTerjun[i].namaDepan);
    }
    for (int i = 0; i < categories.first.rekreasi.length; i++) {
      namaDepan.add(categories.first.rekreasi[i].namaDepan);
    }
    // Nama
    for (int i = 0; i < categories.first.airTerjun.length; i++) {
      nama.add(categories.first.airTerjun[i].nama);
    }
    for (int i = 0; i < categories.first.rekreasi.length; i++) {
      nama.add(categories.first.rekreasi[i].nama);
    }

    final icon = await getBitmapDescriptorFromAssetBytes(
        "assets/images/location.png", 85);
    for (int i = 0;
        i <
            categories.first.airTerjun.length +
                categories.first.rekreasi.length;
        i++) {
      dynamic placemarks = await placemarkFromCoordinates(lat[i], long[i]);
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: LatLng(lat[i], long[i]),
            // icon: BitmapDescriptor.defaultMarkerWithHue(
            //     BitmapDescriptor.hueOrange),
            icon: icon,
            onTap: () {
              _infoWindowController.addInfoWindow!(
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(img[i]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                namaDepan[i] == ''
                                    ? nama[i]
                                    : namaDepan[i] + " " + nama[i],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  overflow: TextOverflow.fade,
                                ),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${placemarks.first.subLocality.toString() + ', ' + placemarks.first.locality.toString()}',
                                style: TextStyle(color: Colors.black54),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Icon(
                              //       FontAwesomeIcons.locationArrow,
                              //       size: 15,
                              //       color: Colors.black54,
                              //     ),
                              //     SizedBox(
                              //       width: 5,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ).asGlass(
                  clipBorderRadius: BorderRadius.circular(20.0),
                ),
                LatLng(lat[i], long[i]),
              );
            }),
      );

      setState(() {
        // stAddress = locations.last.longitude.toString() +
        //     ", " +
        //     locations.last.latitude.toString();
        // stAdd = placemarks.reversed.last.subLocality.toString() +
        //     ", " +
        //     placemarks.reversed.last.locality.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _polygon.add(
      Polygon(
          polygonId: PolygonId('1'),
          points: points,
          // fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          fillColor: Colors.white.withOpacity(0.1),
          geodesic: true,
          strokeWidth: 1,
          strokeColor: Theme.of(context).primaryColor.withOpacity(0.8)),
    );

    return Scaffold(
      appBar: AppBar(
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
        title: Text('Peta Wisata'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Standard',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onTap: () {
                        _controller.future.then(
                          (value) => DefaultAssetBundle.of(context)
                              .loadString('assets/maptheme/standard_theme.json')
                              .then((string) => value.setMapStyle(string)),
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Retro',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onTap: () {
                        _controller.future.then(
                          (value) => DefaultAssetBundle.of(context)
                              .loadString('assets/maptheme/retro_theme.json')
                              .then((string) => value.setMapStyle(string)),
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Aubergine',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onTap: () {
                        _controller.future.then(
                          (value) => DefaultAssetBundle.of(context)
                              .loadString(
                                  'assets/maptheme/aubergine_theme.json')
                              .then((string) => value.setMapStyle(string)),
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Night',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onTap: () {
                        _controller.future.then((value) {
                          DefaultAssetBundle.of(context)
                              .loadString('assets/maptheme/night_theme.json')
                              .then((string) => value.setMapStyle(string));
                        });
                      },
                    ),
                  ])
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            // mapType: MapType.normal,
            compassEnabled: true,
            myLocationEnabled: true,
            markers: Set<Marker>.of(_markers),
            polygons: _polygon,
            onMapCreated: (GoogleMapController controller) {
              _infoWindowController.googleMapController = controller;
              controller.setMapStyle(mapTheme);

              _controller.complete(controller);
            },
            onTap: (position) {
              _infoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _infoWindowController.onCameraMove!();
            },
          ),
          CustomInfoWindow(
            controller: _infoWindowController,
            height: 200,
            width: 300,
            offset: 50,
          ),
          Positioned(
            bottom: 110,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              child: Icon(
                Icons.my_location_outlined,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
              elevation: 0,
              onPressed: () async {
                GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(_kGooglePlex),
                );
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
