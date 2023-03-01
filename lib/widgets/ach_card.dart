import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';

class AchCard extends StatelessWidget {
  AchCard(
      {required this.position,
      required this.competition,
      required this.description,
      required this.time,
      this.skills,
      required this.pic,
      required this.link1,
      this.link2,
      this.link3});
  String position;
  String competition;
  String description;
  String time;
  List<String>? skills;
  String pic;
  String link1;
  String? link2;
  String? link3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  style: positionText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    competition,
                    style: companyText,
                  ),
                ),
                Container(
                  width: 800,
                  child: Text(
                    description,
                    style: descriptionText,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    time,
                    style: descriptionText.copyWith(color: Color(0xff04c189)),
                  ),
                ),
                if (skills!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      children: skills!
                          .map((i) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                    labelPadding: EdgeInsets.all(5),
                                    labelStyle: descriptionText,
                                    backgroundColor: Color(0xff282b38),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.white)),
                                    label: Text(
                                      i,
                                      style: descriptionText.copyWith(
                                          fontSize: 20),
                                    )),
                              ))
                          .toList(),
                    ),
                  ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          html.window.open(link1, "_blank");
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowUpRightFromSquare,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          html.window.open(link2!, "_blank");
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          html.window.open(link3!, "_blank");
                        },
                        icon: Icon(
                          FontAwesomeIcons.linkedinIn,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 65),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 350,
                  child: Image.asset(
                    pic,
                    //height: 100,
                    alignment: Alignment.topLeft,
                    width: 400,
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Color(0xff252734)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
