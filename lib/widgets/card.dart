import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;

class WorkCard extends StatelessWidget {
  WorkCard(
      {required this.position,
      required this.company,
      required this.description,
      required this.duration,
      this.skills,
      required this.pic,
      required this.link});
  String position;
  String company;
  String description;
  String duration;
  List<String>? skills;
  String pic;
  String link;
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
                    company,
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
                    duration,
                    style: descriptionText.copyWith(color: Color(0xff04c189)),
                  ),
                ),
                if (skills!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      children: skills!
                          .map((i) => Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Chip(
                                    labelPadding: EdgeInsets.all(8),
                                    labelStyle: descriptionText,
                                    backgroundColor: Color(0xff282b38),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.white)),
                                    label: Text(
                                      i,
                                      style: descriptionText,
                                    )),
                              ))
                          .toList(),
                    ),
                  ),
                IconButton(
                    onPressed: () {
                      html.window.open(link, "_blank");
                    },
                    icon: Icon(
                      FontAwesomeIcons.arrowUpRightFromSquare,
                      color: Colors.white,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 350,
                  child: Image.asset(
                    pic,
                    //height: 100,
                    alignment: Alignment.topLeft,
                    width: 450,
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
