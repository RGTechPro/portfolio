import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';

class HomePage extends StatelessWidget {
  @override
  final GColors = [Color(0xff282b38), Color.fromARGB(255, 67, 71, 88)];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: GColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Row(
                  children: [
                    Text(
                      'Rishabh ',
                      style: TextStyle(fontFamily: 'Neue'),
                    ),
                    Text(
                      'Gupta',
                      style: TextStyle(
                          fontFamily: 'Neue', color: Color(0xff04c189)),
                    ),
                    Text(
                      '.',
                      style: TextStyle(fontFamily: 'Neue'),
                    ),
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40, top: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue'),
                              )),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('About',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Neue')),
                          style: ButtonStyle(),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('Works',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue'))),
                        TextButton(
                            onPressed: () {},
                            child: Text('Contact',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue')))
                      ],
                    ),
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 150, top: 50),
                      child: SizedBox(
                        width: 500,
                        height: 500,
                        child: Stack(children: [
                          Positioned(
                            left: 70,
                            child: ClipPath(
                              clipper: CustomClipperImage(),
                              child: Container(
                                height: 450,
                                child: Image.asset(
                                  'images/my_photo.png',
                                  //height: 100,
                                  alignment: Alignment.topLeft,
                                  width: 350,
                                  fit: BoxFit.fitWidth,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Color(0xff252734)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 330,
                            child: SizedBox(
                              width: 150,
                              child: Text('Rishabh Gupta.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 330,
                            left: 350,
                            child: SizedBox(
                              width: 150,
                              child: Text('15',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 405,
                            left: 385,
                            child: SizedBox(
                              width: 150,
                              child: Text('Projects',
                                  style: TextStyle(
                                      color: Color(0xff04c189),
                                      fontFamily: 'Neue',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 205,
                            // left: 315,
                            child: SizedBox(
                              width: 150,
                              child: Text('523+',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 265,
                            left: 85,
                            child: SizedBox(
                              width: 150,
                              child: Text('Days',
                                  style: TextStyle(
                                      color: Color(0xff04c189),
                                      fontFamily: 'Neue',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 415,
                            left: 70,
                            child: SizedBox(
                              width: 300,
                              child: Text('SOFTWARE  DEVELOPER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Neue',
                                    fontSize: 15,
                                  )),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  CircularText(radius: 50, children: [
                    TextItem(
                      startAngle: 210,
                      space: 18,
                      text: Text('FLUTTER & CLOUD DEV•',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Neue',
                            fontSize: 15,
                          )),
                    )
                  ])
                ],
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(250.0, 0);
    path.lineTo(250, 100);
    path.lineTo(360, 100);
    path.lineTo(360, 330);
    path.lineTo(275, 330);
    path.lineTo(275, 400);
    path.lineTo(0, 400);
    path.lineTo(0, 300);
    path.lineTo(85, 300);
    path.lineTo(85, 270);
    path.lineTo(70, 270);
    path.lineTo(70, 210);
    path.lineTo(0, 210);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
