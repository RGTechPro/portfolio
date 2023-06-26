import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    double screenWidth = MediaQuery.of(context).size.width; // screen width
 
    double screenHeight = MediaQuery.of(context).size.height; // screen width

    return Padding(
      padding: EdgeInsets.only(
          top: 0.012 * screenWidth,
          left: screenWidth * 0.01,
          right: screenWidth * 0.01),
      child: Container(
        child: ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,

          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            ResponsiveRowColumnItem(
              child: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ResponsiveValue(context,
                              defaultValue: screenWidth * 0.36,
                              valueWhen: [
                           const     Condition.smallerThan(
                                    name: DESKTOP, value: 900.0)
                              ]).value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              title,
                              style: companyText.copyWith(
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: 27.0,
                                      valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.02),
                             const       Condition.smallerThan(
                                        name: TABLET, value: 17.0),
                            const        Condition.smallerThan(
                                        name: MOBILE, value: 25.0),
                                  ]).value),
                            ),
                          ),
                        ),
                        Container(
                          width: ResponsiveValue(context,
                              defaultValue: screenWidth * 0.36,
                              valueWhen: [
                             const   Condition.smallerThan(
                                    name: DESKTOP, value: 900.0)
                              ]).value,
                          child: Text(
                            brief,
                            style: descriptionText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: screenWidth * 0.012,
                                    valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP,
                                      value: screenWidth * 0.014),
                             const     Condition.smallerThan(
                                      name: TABLET, value: 13.5),
                             const     Condition.smallerThan(
                                      name: MOBILE, value: 15.0)
                                ]).value),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            new_date,
                            style: descriptionText.copyWith(
                                color:const Color(0xff04c189)),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  html.window.open(link, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.arrowUpRightFromSquare,
                                  color: Colors.white,
                                )),
                            TextButton(
                              onPressed: () {
                                html.window.open(link, "_blank");
                              },
                              child:const Text(
                                'Continue Reading...',
                                style: companyText,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 550,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              title,
                              style: companyText.copyWith(
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: 22.0,
                                      valueWhen:const [
                                    Condition.smallerThan(
                                        name: DESKTOP, value: 22.0),
                                    Condition.smallerThan(
                                        name: TABLET, value: 22.0),
                                    Condition.smallerThan(
                                        name: MOBILE, value: 25.0),
                                  ]).value),
                            ),
                          ),
                        ),
                        Container(
                          width: ResponsiveValue(context,
                              defaultValue: screenWidth * 0.544,
                              valueWhen: [
                          const      Condition.smallerThan(
                                    name: DESKTOP, value: 900.0)
                              ]).value,
                          child: Text(
                            brief,
                            style: descriptionText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: screenWidth * 0.012,
                                    valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP,
                                      value: screenWidth * 0.014),
                          const        Condition.smallerThan(
                                      name: TABLET, value: 13.5),
                             const     Condition.smallerThan(
                                      name: MOBILE, value: 15.0)
                                ]).value),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            new_date,
                            style: descriptionText.copyWith(
                                color:const Color(0xff04c189)),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  html.window.open(link, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.arrowUpRightFromSquare,
                                  color: Colors.white,
                                )),
                            TextButton(
                              onPressed: () {
                                html.window.open(link, "_blank");
                              },
                              child:const Text(
                                'Continue Reading...',
                                style: companyText,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
            ResponsiveRowColumnItem(
              columnOrder: 1073741822,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ResponsiveValue(context,
                      defaultValue: 100.0,
                      valueWhen: [
                    const    Condition.smallerThan(name: DESKTOP, value: 10.0)
                      ]).value!,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: ResponsiveValue(context,
                        defaultValue: screenWidth * 0.31,
                        valueWhen: [
                          Condition.smallerThan(
                              name: DESKTOP, value: screenWidth * 0.23),
                          Condition.smallerThan(
                              name: TABLET, value: screenWidth * 0.24),
                     const     Condition.smallerThan(name: MOBILE, value: 300.0),
                        ]).value,
                    //450,
                   
                    decoration:const BoxDecoration(
                        shape: BoxShape.rectangle, color: Color(0xff252734)), child: Image.network(
                      pic,
                      //height: 100,
                      alignment: Alignment.topLeft,
                      width: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.4,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.5),
                            Condition.smallerThan(
                                name: TABLET, value: screenWidth * 0.5),
                           const Condition.smallerThan(name: MOBILE, value: 500.0),
                          ]).value,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
