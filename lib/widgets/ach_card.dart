import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:portfolio/models/skillChip.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
  List<SkillChip>? skills;
  String pic;
  String link1;
  String? link2;
  String? link3;

  @override
  Widget build(BuildContext context) {
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

          // rowPadding: const EdgeInsets.all(30),
          // columnPadding: const EdgeInsets.all(30),
          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
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
                               const Condition.smallerThan(name: TABLET, value: 17.0)
                              ]).value),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.0068),
                          child: Text(
                            competition,
                            style: companyText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: 27.0,
                                    valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP,
                                      value: screenWidth * 0.022),
                            const      Condition.smallerThan(
                                      name: TABLET, value: 19.0)
                                ]).value),
                          ),
                        ),
                        Container(
                          width: ResponsiveValue(context,
                              defaultValue: screenWidth * 0.544,
                              valueWhen: [
                            const    Condition.smallerThan(
                                    name: DESKTOP, value: 900.0)
                              ]).value,
                          //width: 800,
                          child: Text(
                            description,
                            style: descriptionText.copyWith(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: screenWidth * 0.012,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.015),
                               const     Condition.smallerThan(
                                        name: TABLET, value: 13.0)
                                  ]).value,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            time,
                            style: descriptionText.copyWith(
                                color:const Color(0xff04c189),
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
                                 const Condition.smallerThan(
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
                                              const    Color(0xff282b38),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  side:const BorderSide(
                                                      color: Colors.white)),
                                              label: Text(
                                                i.skill,
                                                style: descriptionText.copyWith(
                                                    fontSize:
                                                        screenWidth * 0.01),
                                              )),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            IconButton(
                                padding: EdgeInsets.all(ResponsiveValue(context,
                                    defaultValue: 8.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.0054)
                                    ]).value!),
                                onPressed: () {
                                  html.window.open(link1, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.arrowUpRightFromSquare,
                                  color: Colors.white,
                                )),
                            IconButton(
                                padding: EdgeInsets.all(ResponsiveValue(context,
                                    defaultValue: 8.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.0054)
                                    ]).value!),
                                onPressed: () {
                                  html.window.open(link2!, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.github,
                                  color: Colors.white,
                                )),
                           if(link3!=null)
                            IconButton(
                                padding: EdgeInsets.all(ResponsiveValue(context,
                                    defaultValue: 8.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.0054)
                                    ]).value!),
                                onPressed: () {
                                  html.window.open(link3!, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.linkedinIn,
                                  color: Colors.white,
                                )),
                          ],
                        )
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
                     const           Condition.smallerThan(
                                    name: TABLET, value: 17.0),
                             const   Condition.smallerThan(
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
                                competition,
                                style: companyText.copyWith(
                                    fontSize: ResponsiveValue(context,
                                        defaultValue: 30.0,
                                        valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.022),
                             const        Condition.smallerThan(
                                          name: TABLET, value: 19.0),
                              const        Condition.smallerThan(
                                          name: MOBILE, value: 25.0),
                                    ]).value),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenWidth * 0.0068),
                              child: Text(
                                time,
                                style: descriptionText.copyWith(
                                    color:const Color(0xff04c189),
                                    fontSize: ResponsiveValue(context,
                                        defaultValue: 22.0,
                                        valueWhen: [
                                          Condition.smallerThan(
                                              name: DESKTOP,
                                              value: screenWidth * 0.02),
                                          Condition.smallerThan(
                                              name: MOBILE,
                                              value: screenWidth * 0.03),
                                   const       Condition.smallerThan(
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
                           const       Condition.smallerThan(
                                      name: DESKTOP, value: 900.0)
                                ]).value,
                            //width: 800,
                            child: Text(
                              description,
                              style: descriptionText.copyWith(
                                fontSize: ResponsiveValue(context,
                                    defaultValue: screenWidth * 0.012,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.014),
                              const        Condition.smallerThan(
                                          name: TABLET, value: 13.5),
                              const        Condition.smallerThan(
                                          name: MOBILE, value: 15.0)
                                    ]).value,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
               
              
                        if (skills!.isNotEmpty)
                          Container(
                            width: ResponsiveValue(context,
                                defaultValue: screenWidth * 0.544,
                                valueWhen: [
                            const      Condition.smallerThan(
                                      name: DESKTOP, value: 900.0)
                                ]).value,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenWidth * 0.0068),
                              child: Wrap(
                                children: skills!
                                    .map((i) => Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, bottom: 2),
                                          child: Chip(
                                              avatar: i.icon,
                                              labelPadding: EdgeInsets.all(
                                                  screenWidth * 0.0034),
                                              labelStyle: descriptionText,
                                              backgroundColor:
                                               const   Color(0xff282b38),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  side:const BorderSide(
                                                      color: Colors.white)),
                                              label: Text(
                                                i.skill,
                                                style: descriptionText.copyWith(
                                                    fontSize: ResponsiveValue(
                                                        context,
                                                        defaultValue:
                                                            screenWidth *
                                                                0.012245,
                                                        valueWhen: [
                                          const            Condition.smallerThan(
                                                          name: MOBILE,
                                                          value: 15.0),
                                                           Condition.smallerThan(
                                                          name: TABLET,
                                                          value: screenWidth *
                                                                0.015245)
                                                    ]).value

                                                    //screenWidth * 0.012245
                                                    ),
                                              )),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            IconButton(
                                padding: EdgeInsets.all(ResponsiveValue(context,
                                    defaultValue: 8.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.0054)
                                    ]).value!),
                                onPressed: () {
                                  html.window.open(link1, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.arrowUpRightFromSquare,
                                  color: Colors.white,
                                )),
                            IconButton(
                                padding: EdgeInsets.all(ResponsiveValue(context,
                                    defaultValue: 8.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.0054)
                                    ]).value!),
                                onPressed: () {
                                  html.window.open(link2!, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.github,
                                  color: Colors.white,
                                )),
                            IconButton(
                                padding: EdgeInsets.all(ResponsiveValue(context,
                                    defaultValue: 8.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.0054)
                                    ]).value!),
                                onPressed: () {
                                  html.window.open(link3!, "_blank");
                                },
                                icon:const Icon(
                                  FontAwesomeIcons.linkedinIn,
                                  color: Colors.white,
                                )),
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
               const         Condition.smallerThan(name: DESKTOP, value: 10.0)
                      ]).value!,
                  left: ResponsiveValue(context,
                      defaultValue: screenWidth * 0.044,
                      valueWhen: [
                   const     Condition.smallerThan(name: DESKTOP, value: 0.0)
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
                  const        Condition.smallerThan(name: MOBILE, value: 265.0),
                        ]).value,

                    //450

                
                    decoration:const BoxDecoration(
                        shape: BoxShape.rectangle, color: Color(0xff252734)),    child: Image.asset(
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
                         const   Condition.smallerThan(name: MOBILE, value: 500.0),
                          ]).value,

                      //400
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
