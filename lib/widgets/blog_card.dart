import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:intl/intl.dart';

class BlogCard extends StatelessWidget {
  BlogCard(
      {required this.title,
      required this.brief,
      required this.date,
      required this.pic,
      required this.link});
  String title;
  String brief;
  String date;
  String pic;
  String link;

  @override
  Widget build(BuildContext context) {
    DateTime dateP = DateTime.parse(date);
    String new_date = DateFormat.yMMMMd().format(dateP);

    print(new_date);
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
                Container(
                  width: 550,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      title,
                      style: companyText,
                    ),
                  ),
                ),
                Container(
                  width: 550,
                  child: Text(
                    brief,
                    style: descriptionText,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    new_date,
                    style: descriptionText.copyWith(color: Color(0xff04c189)),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          html.window.open(link, "_blank");
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowUpRightFromSquare,
                          color: Colors.white,
                        )),
                    TextButton(
                      onPressed: () {
                                                  html.window.open(link, "_blank");

                      },
                      child: Text(
                        'Continue Reading...',
                        style: companyText,
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 450,
                  child: Image.network(
                    pic,
                    //height: 100,
                    alignment: Alignment.topLeft,
                    width: 675,
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
