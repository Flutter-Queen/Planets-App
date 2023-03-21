import 'package:flutter/material.dart';

import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import '../Constants/constants.dart';
import '../Model/planet_model.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpeg'), fit: BoxFit.cover),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  Row(
                    children: const [
                      Text(
                        'Explore Planets',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 40,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            child: Text(
                              'Solar System',
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 24,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                        onChanged: (value) {},
                        icon: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.arrow_drop_down,
                              color: Colors.white54),
                        ),
                        underline: const SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Swiper(
                  itemCount: planets.length,
                  fade: 0.3,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeSize: 20,
                          activeColor: Color(0xFF425A98),
                          space: 5)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, a, b) => DetailsView(
                                planetInfo: planets[index],
                              ),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ));
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 50,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                elevation: 8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 150,
                                      ),
                                      Text(
                                        planets[index].name.toString(),
                                        style: const TextStyle(
                                            fontSize: 40,
                                            fontFamily: 'Avenir',
                                            color: Color(0xffAF2730),
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "Solar System",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontFamily: 'Avenir',
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Learn more",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Avenir',
                                                  color: secondaryTextColor,
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_rounded,
                                              color: secondaryTextColor,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Hero(
                              tag: planets[index].position,
                              child: Image.asset(
                                  planets[index].iconImage.toString()))
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
