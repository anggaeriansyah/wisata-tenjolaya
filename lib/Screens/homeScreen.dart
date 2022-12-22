import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisata_tenjolaya/Screens/aboutScreen.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wisata_tenjolaya/Screens/maps.dart';
import 'package:wisata_tenjolaya/Screens/pengaturanScreen.dart';
import 'package:wisata_tenjolaya/models/categories_model.dart';
import 'package:wisata_tenjolaya/widget/airTerjun_carousel.dart';
import 'package:wisata_tenjolaya/widget/rekreasi_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentTab = 0;
  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(''
  //       // 'Home',
  //       // style: optionStyle,
  //       ),
  //   Text(
  //     'Search',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Profile',
  //     style: optionStyle,
  //   ),
  // ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image(
            height: 38,
            width: 38,
            image: AssetImage(
              'assets/images/wite-white.png',
            ),
          ),
        ),
        // elevation: 0,
        centerTitle: true,
        title: Text('WISATA TENJOLAYA',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)
            // style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pengaturan()));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  FontAwesomeIcons.gear,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                'Pengaturan',
                                style: TextStyle(
                                    // fontStyle: Theme.of(context).textTheme,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutScreen()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                FontAwesomeIcons.circleInfo,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              'Tentang Aplikasi',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                    ),
                  ])
        ],
        // shadowColor: Colors.grey,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [
            Container(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 80),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Agne',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Temukan tempat wisata terbaik di Tenjolaya!'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20, right: 100, top: 10),
            //   child: Text(
            //     'Temukan tempat wisata terbaik di tenjolaya!',
            //     style: TextStyle(
            //       fontSize: 25.0,
            //       fontWeight: FontWeight.bold,
            //       color: Theme.of(context).primaryColor,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Maps()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -2,
                            color: Colors.black26,
                            // offset: Offset(0, 5),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapLocationDot,
                              color: Colors.white,
                              size: 27,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Lihat Peta Wisata',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AirTerjunCarousel(),
            SizedBox(
              height: 5,
            ),
            RekreasiCarousel(),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   child: GNav(
      //     backgroundColor: Colors.white,
      //     gap: 8,
      //     color: Theme.of(context).primaryColor,
      //     activeColor: Colors.white,
      //     tabBackgroundColor: Theme.of(context).primaryColor,
      //     padding: EdgeInsets.all(15),
      //     tabs: [
      //       GButton(
      //         icon: Icons.home_filled,
      //         text: 'Home',
      //       ),
      //       GButton(
      //         icon: Icons.search_outlined,
      //         text: 'Search',
      //       ),
      //       GButton(
      //         icon: Icons.info_outline,
      //         text: 'About',
      //         // onPressed: () {
      //         //   Navigator.push(
      //         //       context, MaterialPageRoute(builder: (context) => Maps()));
      //         // },
      //       ),
      //       GButton(
      //         icon: Icons.settings,
      //         text: 'Settings',
      //       ),
      //     ],
      //     selectedIndex: _selectedIndex,
      //     onTabChange: (index) {
      //       setState(() {
      //         _selectedIndex = index;
      //       });
      //     },
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentTab,
      //   onTap: (int value) {
      //     setState(() {
      //       _currentTab = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home_filled,
      //         size: 30,
      //       ),
      //       // activeIcon: SizedBox.shrink(),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.search,
      //         size: 30,
      //       ),
      //       // activeIcon: SizedBox.shrink(),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.info,
      //         size: 30,
      //       ),
      //       // icon: CircleAvatar(
      //       //   radius: 15,
      //       //   backgroundImage: NetworkImage('https://imgur.com/QmHpBWh.jpg'),
      //       // ),

      //       // activeIcon: SizedBox.shrink(),
      //       label: 'About',
      //     ),
      //   ],
      // ),
    );
  }
}
