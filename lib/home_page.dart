import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                      style:
                          TextStyle(fontFamily: 'Neue', color: Color(0xff04c189)),
                    ),
                    Text(
                      '.',
                      style: TextStyle(fontFamily: 'Neue'),
                    ),
                  ],
                ),
              ),
              actions: [
                SizedBox(height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40, top: 30),
                    child: Row(
                      children: [
                        SizedBox(height: 50,
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
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
