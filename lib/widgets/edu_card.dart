import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';

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
          columnCrossAxisAlignment: CrossAxisAlignment.start,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,

          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType
                  .ROW, //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            ResponsiveRowColumnItem(
              child: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'College',
                          style: positionText,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: ResponsiveValue(context,
                                defaultValue: screenWidth * 0.36,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP, value: 900.0)
                                ]).value,
                            child: Text(
                              collegeName,
                              style: companyText.copyWith(
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: 27.0,
                                      valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.02),
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
                              defaultValue: screenWidth * 0.36,
                              valueWhen: [
                                Condition.smallerThan(
                                    name: DESKTOP, value: 900.0)
                              ]).value,
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
                            style: descriptionText.copyWith(
                                color: Color(0xff04c189)),
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
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'College',
                          style: positionText,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: ResponsiveValue(context,
                                defaultValue: screenWidth * 0.36,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP, value: 900.0)
                                ]).value,
                            child: Text(
                              collegeName,
                              style: companyText.copyWith(
                                  fontSize: ResponsiveValue(context,
                                      defaultValue: 27.0,
                                      valueWhen: [
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
                              defaultValue: screenWidth * 0.36,
                              valueWhen: [
                                Condition.smallerThan(
                                    name: DESKTOP, value: 900.0)
                              ]).value,
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
                            style: descriptionText.copyWith(
                                color: Color(0xff04c189)),
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
            ),
            ResponsiveRowColumnItem(
              columnOrder: 1073741822,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ResponsiveValue(context,
                      defaultValue: 100.0,
                      valueWhen: [
                        Condition.smallerThan(name: DESKTOP, value: 10.0)
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
                          Condition.smallerThan(name: MOBILE, value: 350.0),
                        ]).value,
                    child: Image.asset(
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
