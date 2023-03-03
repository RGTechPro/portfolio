import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';

class EduCard extends StatelessWidget {
  EduCard(
      {required this.collegeName,
      required this.description,
      required this.duration,
      required this.pic,
      required this.link});

  String collegeName;
  String description;
  String duration;
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
                  'College',
                  style: positionText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 450,
                    child: Text(
                      collegeName,
                      style: companyText,
                    ),
                  ),
                ),
                Container(
                  width: 400,
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
              padding: const EdgeInsets.only(bottom: 100, left: 65),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 450,
                  child: Image.asset(
                    pic,
                    //height: 100,
                    alignment: Alignment.topLeft,
                    width: 700,
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
