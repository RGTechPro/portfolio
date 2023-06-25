import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/models/skillChip.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProCard extends StatelessWidget {
  ProCard(
      {required this.name,
      required this.description,
      this.skills,
      required this.pic,
      this.link1,
      this.link2,
      this.noi});
  String name;
  String description;
  List<SkillChip>? skills;
  String pic;
  String? link1;
  String? link2;
  int? noi;

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

          //crossAxisAlignment: CrossAxisAlignment.baseline,
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
                            name,
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
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    html.window.open(link1!, "_blank");
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.github,
                                    color: Colors.white,
                                  )),
                              if (link2 != null)
                                IconButton(
                                    onPressed: () {
                                      html.window.open(link2!, "_blank");
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.googlePlay,
                                      color: Colors.white,
                                    )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff04c189))),
                              child: TextButton(
                                  onPressed: () {
                                    showCustomDialog(context, noi!, name);
                                  },
                                  child: Text(
                                    'Project Gallery',
                                    style: positionText,
                                  )),
                            ),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
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
                                                              value:
                                                                  screenWidth *
                                                                      0.015245)
                                                        ]).value,
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
                                  onPressed: () {
                                    html.window.open(link1!, "_blank");
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.github,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    html.window.open(link2!, "_blank");
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.googlePlay,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff04c189))),
                              child: TextButton(
                                  onPressed: () {
                                    showCustomDialog(context, noi!, name);
                                  },
                                  child: Text(
                                    'Project Gallery',
                                    style: positionText.copyWith(
                                        fontSize: ResponsiveValue(context,
                                            defaultValue: 18.0,
                                            valueWhen: [
                                          Condition.smallerThan(
                                              name: MOBILE, value: 15.0),
                                          Condition.smallerThan(
                                              name: TABLET, value: 18.0)
                                        ]).value),
                                  )),
                            ),
                          )
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
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: ResponsiveValue(context,
                        defaultValue: screenWidth * 0.406,
                        valueWhen: [
                          Condition.smallerThan(
                              name: DESKTOP, value: screenWidth * 0.219),
                          Condition.smallerThan(
                              name: TABLET, value: screenWidth * 0.45),
                          Condition.smallerThan(name: MOBILE, value: 400.0),
                        ]).value,
                    child: Image.asset(
                      pic,
                      //height: 100,
                      alignment: Alignment.topLeft,
                      width: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.22,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.18),
                            Condition.smallerThan(
                                name: TABLET, value: screenWidth * 0.23),
                            Condition.smallerThan(name: MOBILE, value: 230.0),
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

void showCustomDialog(BuildContext context, int noi, String name) {
  CarouselController buttonCarouselController = CarouselController();

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Stack(children: [
        Center(
          child: Container(
            height: 600,
            width: 300,
            child: CarouselSlider.builder(
              carouselController: buttonCarouselController,
              options: CarouselOptions(height: 600.0, viewportFraction: 1),
              itemCount: noi,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 600,
                    child: CachedNetworkImage(
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/todo-a836d.appspot.com/o/portfolio%2F${name.replaceAll(' ', '%20').replaceAll(',', '%2C')}${itemIndex + 1}.jpeg?alt=media",
                        placeholder: (context, url) =>
                            new Image.asset('images/loading.gif'),
                        errorWidget: (context, url, error) {
                          return new Icon(Icons.error);
                        }),
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40)),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  iconSize: 75,
                  onPressed: () {
                    buttonCarouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  icon: Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                    iconSize: 75,
                    onPressed: () {
                      buttonCarouselController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    )),
              )),
        ),
        // Align(
        //   alignment: AlignmentDirectional.topStart,
        //   child: Material(
        //       color: Colors.transparent,
        //       child: Padding(
        //         padding: const EdgeInsets.only(left: 10.0),
        //         child: IconButton(
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //             icon: Icon(
        //               FontAwesomeIcons.xmark,
        //               color: Colors.black54.withOpacity(0.25),
        //             )),
        //       )),
        // )
      ]);
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
