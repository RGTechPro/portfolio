import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:portfolio/models/skillChip.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';

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
  List<SkillChip>? skills;
  String pic;
  String link;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // screen width
    print(screenWidth);
    double screenHeight = MediaQuery.of(context).size.height; // screen width

    return Padding(
      padding: EdgeInsets.only(
          top: 0.012 * screenWidth,
          left: screenWidth * 0.01,
          right: screenWidth * 0.01),
      child: Container(
        child: ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
                child: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            position,
                            style: positionText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: 22.0,
                                    valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP, value: screenWidth * 0.02),
                                  Condition.smallerThan(
                                      name: TABLET, value: 17.0)
                                ]).value),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenWidth * 0.0068),
                            child: Text(
                              company,
                              style: companyText.copyWith(
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: 27.0,
                                      valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.022),
                                    Condition.smallerThan(
                                        name: TABLET, value: 19.0)
                                  ]).value),
                            ),
                          ),
                          Container(
                            width: ResponsiveValue(context,
                                defaultValue: screenWidth * 0.544,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP, value: 900.0)
                                ]).value,
                            child: Text(
                              description,
                              style: descriptionText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: screenWidth * 0.012,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.015),
                                      Condition.smallerThan(
                                          name: TABLET, value: 13.0)
                                    ]).value,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              duration,
                              style: descriptionText.copyWith(
                                  color: Color(0xff04c189),
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: 20.0,
                                      valueWhen: [
                                        Condition.smallerThan(
                                            name: DESKTOP,
                                            value: screenWidth * 0.0225)
                                      ]).value),
                            ),
                          ),
                          if (skills!.isNotEmpty)
                            Container(
                              width: ResponsiveValue(context,
                                  defaultValue: screenWidth * 0.544,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP, value: 900.0)
                                  ]).value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.0068),
                                child: Wrap(
                                  children: skills!
                                      .map((i) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 7),
                                            child: Chip(
                                                avatar: i.icon,
                                                labelPadding: EdgeInsets.all(
                                                    screenWidth * 0.003),
                                                labelStyle: descriptionText,
                                                backgroundColor:
                                                    Color(0xff282b38),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    side: BorderSide(
                                                        color: Colors.white)),
                                                label: Text(
                                                  i.skill,
                                                  style:
                                                      descriptionText.copyWith(
                                                          fontSize:
                                                              screenWidth *
                                                                  0.01),
                                                )),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          IconButton(
                              padding: EdgeInsets.all(ResponsiveValue(context,
                                  defaultValue: 8.0,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.0054)
                                  ]).value!),
                              onPressed: () {
                                html.window.open(link, "_blank");
                              },
                              icon: Icon(
                                FontAwesomeIcons.arrowUpRightFromSquare,
                                color: Colors.white,
                              ))
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            position,
                            style: positionText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: 25.0,
                                    valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP, value: screenWidth * 0.02),
                                  Condition.smallerThan(
                                      name: TABLET, value: 17.0),
                                  Condition.smallerThan(
                                      name: MOBILE, value: 20.0),
                                ]).value),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.0068),
                                child: Text(
                                  company,
                                  style: companyText.copyWith(
                                      fontSize: ResponsiveValue(context,
                                          defaultValue: 30.0,
                                          valueWhen: [
                                        Condition.smallerThan(
                                            name: DESKTOP,
                                            value: screenWidth * 0.022),
                                        Condition.smallerThan(
                                            name: TABLET, value: 19.0),
                                        Condition.smallerThan(
                                            name: MOBILE, value: 25.0),
                                      ]).value),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.0068),
                                child: Text(
                                  duration,
                                  style: descriptionText.copyWith(
                                      color: Color(0xff04c189),
                                      fontSize: ResponsiveValue(context,
                                          defaultValue: 22.0,
                                          valueWhen: [
                                            Condition.smallerThan(
                                                name: DESKTOP,
                                                value: screenWidth * 0.02),
                                            Condition.smallerThan(
                                                name: MOBILE,
                                                value: screenWidth * 0.03),
                                            Condition.smallerThan(
                                                name: MOBILE, value: 20.0),
                                            //   Condition.smallerThan(
                                            // name: 'SMOBILE',
                                            // value: screenWidth * 0.03)
                                          ]).value),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Container(
                              width: ResponsiveValue(context,
                                  defaultValue: screenWidth * 0.544,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP, value: 900.0)
                                  ]).value,
                              child: Text(
                                description,
                                style: descriptionText.copyWith(
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: screenWidth * 0.012,
                                      valueWhen: [
                                        Condition.smallerThan(
                                            name: DESKTOP,
                                            value: screenWidth * 0.014),
                                        Condition.smallerThan(
                                            name: TABLET, value: 13.5),
                                        Condition.smallerThan(
                                            name: MOBILE, value: 15.0)
                                      ]).value,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 7),
                          //   child: Text(
                          //     duration,
                          //     style: descriptionText.copyWith(
                          //                 color: Color(0xff04c189),
                          //                 fontSize: ResponsiveValue(context,
                          //                     defaultValue: 20.0,
                          //                     valueWhen: [
                          //                       Condition.smallerThan(
                          //                           name: DESKTOP,
                          //                           value: screenWidth * 0.0225)
                          //                     ]).value),
                          //   ),
                          // ),
                          if (skills!.isNotEmpty)
                            Container(
                              width: ResponsiveValue(context,
                                  defaultValue: screenWidth * 0.544,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP, value: 900.0)
                                  ]).value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.0068),
                                child: Wrap(
                                  children: skills!
                                      .map((i) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 10),
                                            child: Chip(
                                                avatar: i.icon,
                                                labelPadding: EdgeInsets.all(
                                                    screenWidth * 0.0034),
                                                labelStyle: descriptionText,
                                                backgroundColor:
                                                    Color(0xff282b38),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    side: BorderSide(
                                                        color: Colors.white)),
                                                label: Text(
                                                  i.skill,
                                                  style:
                                                      descriptionText.copyWith(
                                                          fontSize: ResponsiveValue(
                                                              context,
                                                              defaultValue:
                                                                  screenWidth *
                                                                      0.012245,
                                                              valueWhen: [
                                                        Condition.smallerThan(
                                                            name: MOBILE,
                                                            value: 15.0),
                                                        Condition.smallerThan(
                                                            name: TABLET,
                                                            value: screenWidth *
                                                                0.015245)
                                                      ]).value),
                                                )),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          IconButton(
                              padding: EdgeInsets.all(ResponsiveValue(context,
                                  defaultValue: 8.0,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.0054)
                                  ]).value!),
                              onPressed: () {
                                html.window.open(link, "_blank");
                              },
                              icon: Icon(
                                FontAwesomeIcons.arrowUpRightFromSquare,
                                color: Colors.white,
                              ))
                        ],
                      )),
            ResponsiveRowColumnItem(
              columnOrder: 1073741822,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ResponsiveValue(context,
                      defaultValue: 100.0,
                      valueWhen: [
                        Condition.smallerThan(name: DESKTOP, value: 10.0)
                      ]).value!,
                  left: ResponsiveValue(context,
                      defaultValue: screenWidth * 0.044,
                      valueWhen: [
                        Condition.smallerThan(name: DESKTOP, value: 0.0)
                      ]).value!,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: ResponsiveValue(context,
                        defaultValue: screenWidth * 0.306,
                        valueWhen: [
                          Condition.smallerThan(
                              name: DESKTOP, value: screenWidth * 0.197),
                          Condition.smallerThan(
                              name: TABLET, value: screenWidth * 0.24),
                          Condition.smallerThan(name: MOBILE, value: 300.0),
                        ]).value,
                    child: Image.asset(
                      pic,
                      //height: 100,
                      alignment: Alignment.topLeft,
                      width: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.272,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.375),
                            Condition.smallerThan(
                                name: TABLET, value: screenWidth * 0.5),
                            Condition.smallerThan(name: MOBILE, value: 500.0),
                          ]).value,
                      fit: BoxFit.fill,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Color(0xff252734)),
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
//562 460