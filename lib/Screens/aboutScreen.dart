import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wisata_tenjolaya/models/categories_model.dart';
import 'package:wisata_tenjolaya/widget/rekreasi_carousel.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // final TabController _tabControl = TabController(length: 3, vsync: this);

  // List _rekomendasi = [];

  // List<int> _pilihan = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    dataSet();
  }

  List alamat = [];
  List alamatKec = [];
  List hariOp = [];
  List hariOpLainnya = [];
  List jamOp = [];
  List jamOpLainnya = [];
  List camping = [];
  List tiket = [];
  List deskripsi = [];
  List img = [];
  List imageGalerys = [];
  List lat = [];
  List long = [];
  List namaDepan = [];
  List namabel = [];
  List likes = [];
  List namaRek = [];

  dataSet() {
    setState(() {
      // Air Terjun
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        alamat.add(categories.first.airTerjun[i].alamat);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        alamatKec.add(categories.first.airTerjun[i].alamatKec);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        hariOp.add(categories.first.airTerjun[i].hariOp);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        hariOpLainnya.add(categories.first.airTerjun[i].hariOpLainnya);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        jamOp.add(categories.first.airTerjun[i].jamOp);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        jamOpLainnya.add(categories.first.airTerjun[i].jamOpLainnya);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        camping.add(categories.first.airTerjun[i].camping);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        tiket.add(categories.first.airTerjun[i].tiket);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        deskripsi.add(categories.first.airTerjun[i].deskripsi);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        img.add(categories.first.airTerjun[i].image);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        imageGalerys.add(categories.first.airTerjun[i].imageGalerys);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        lat.add(categories.first.airTerjun[i].lat);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        long.add(categories.first.airTerjun[i].long);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        namaDepan.add(categories.first.airTerjun[i].namaDepan);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        namabel.add(categories.first.airTerjun[i].nama);
      }
      for (int i = 0; i < categories.first.airTerjun.length; i++) {
        likes.add(categories.first.airTerjun[i].likes);
      }
    });
  }

  tambahData(
    int indx, {
    image,
    namaDep,
    namaBel,
    alamat,
    alamatKec,
    hariOp,
    hariOpLainnya,
    jamOp,
    jamOpLainnya,
    camping,
    tiket,
    deskripsi,
    imageGalerys,
    lat,
    long,
    likes,
  }) {
    if (namaRek.any((element) => element == namaBel)) {
    } else if (categories.first.rekomendasi.length >= 3) {
    } else {
      categories.first.rekomendasi.add(Rekomend(
          image: image,
          namaDepan: namaDep,
          nama: namaBel,
          alamat: alamat,
          alamatKec: alamatKec,
          hariOp: hariOp,
          hariOpLainnya: hariOpLainnya,
          jamOp: jamOp,
          jamOpLainnya: jamOpLainnya,
          camping: camping,
          tiket: tiket,
          deskripsi: deskripsi,
          imageGalerys: imageGalerys,
          lat: lat,
          long: long,
          likes: likes));

      namaRek.add(namaBel);
    }
    setState(() {});
  }

  addData(String nilai1, String nilai2, String nilai3) {
    setState(() {
      // _rekomendasi.add(nilai1);
      // _rekomendasi.add(nilai2);
      // _rekomendasi.add(nilai3);
      categories.first.rekomendasi.add(nilai1);
      categories.first.rekomendasi.add(nilai2);
      categories.first.rekomendasi.add(nilai3);
    });
  }

  removeData(int isi) {
    setState(() {
      categories.first.rekomendasi.removeAt(isi);
      namaRek.removeAt(isi);
    });
  }

  @override
  Widget build(BuildContext context) {
    // _rekomendasi.add(Text(tambah));
    // _rekomendasi.clear();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Rekomendasi ${namaRek.length}'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(children: [
        Container(
          // width: double.maxFinite,
          height: 150,
          // color: Colors.red,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.first.rekomendasi.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              // margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.width * 0.25,
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Center(
                                  child: Text(
                                    categories.first.rekomendasi[index].nama,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => removeData(index),
                              child: Container(
                                child: Icon(
                                  CupertinoIcons.xmark_square_fill,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          // width: double.maxFinite,
          height: MediaQuery.of(context).size.width,
          // color: Theme.of(context).primaryColor,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: categories.first.airTerjun.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          // categories.first.rekomendasi.length
                          tambahData(
                            index,
                            namaDep: namaDepan[index],
                            namaBel: namabel[index],
                            alamat: alamat[index],
                            alamatKec: alamatKec[index],
                            camping: camping[index],
                            deskripsi: deskripsi[index],
                            hariOp: hariOp[index],
                            hariOpLainnya: hariOpLainnya[index],
                            jamOp: jamOp[index],
                            jamOpLainnya: jamOpLainnya[index],
                            imageGalerys: imageGalerys[index],
                            image: img[index],
                            lat: lat[index],
                            long: long[index],
                            likes: likes[index],
                            tiket: tiket[index],
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.25,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            namabel[index],
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )),
                        ),
                      ),
                    );
                  })),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            likes.sort((a, b) => b - a);
            // categories.first.airTerjun.clear();
            addData(categories.first.airTerjun[0],
                categories.first.airTerjun[1], categories.first.airTerjun[2]);
            likes.sort((a, b) => a - b);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: 50,
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Text(
                'pilih berdasarkan nilai terbesar',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
            ),
          ),
        ),
      ]),

      // Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             color: Colors.amber,
      //             height: MediaQuery.of(context).size.width * 0.25,
      //             width: MediaQuery.of(context).size.width * 0.25,
      //           ),
      //           Container(
      //             color: Colors.amber,
      //             height: MediaQuery.of(context).size.width * 0.25,
      //             width: MediaQuery.of(context).size.width * 0.25,
      //           ),
      //           Container(
      //             color: Colors.amber,
      //             height: MediaQuery.of(context).size.width * 0.25,
      //             width: MediaQuery.of(context).size.width * 0.25,
      //           ),
      //         ],
      //       ),
      //     ),

      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Align(
      //         alignment: Alignment.centerLeft,
      //         child: Text(
      //           'Pilih Wisata yang direkomendasikan',
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     RekreasiCarousel(),
      //   ],
      // ),
    );
  }
}
