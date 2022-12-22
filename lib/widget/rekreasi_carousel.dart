import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wisata_tenjolaya/models/categories_model.dart';
import '../Screens/rekreasiScreen.dart';

class RekreasiCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Wisata Rekreasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => print('Lihat Semua'),
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Container(
          height: 310,
          // color: Colors.teal,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.first.rekreasi.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RekreasiScreen(
                        rekreasi: categories.first.rekreasi[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 250,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 17),
                  // color: Colors.red,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 100,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: -3,
                                color: Colors.black26,
                                offset: Offset(0, 5),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 13,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                categories.first.rekreasi[index].hariOp ==
                                        'Tutup Sementara'
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              categories
                                                  .first.rekreasi[index].hariOp,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            categories
                                                .first.rekreasi[index].hariOp,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            categories
                                                .first.rekreasi[index].jamOp,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                categories.first.rekreasi[index]
                                            .hariOpLainnya ==
                                        ''
                                    ? categories.first.rekreasi[index].hariOp !=
                                            'Tutup Sementara'
                                        ? Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 25,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.rotate,
                                                  size: 19,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            categories.first.rekreasi[index]
                                                .hariOpLainnya,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            categories.first.rekreasi[index]
                                                .jamOpLainnya,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(children: <Widget>[
                          Hero(
                            tag: Text(
                                '${categories.first.rekreasi[index].image}'),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                height: 220,
                                width: 220,
                                image: AssetImage(
                                    categories.first.rekreasi[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 160,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black38],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  categories.first.rekreasi[index].namaDepan,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  categories.first.rekreasi[index].nama,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          categories
                                              .first.rekreasi[index].alamat,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          categories
                                              .first.rekreasi[index].alamatKec,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
