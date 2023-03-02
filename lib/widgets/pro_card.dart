import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  List<String>? skills;
  String pic;
  String? link1;
  String? link2;
  int? noi;

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
                  name,
                  style: positionText,
                ),
                Container(
                  width: 800,
                  child: Text(
                    description,
                    style: descriptionText,
                    textAlign: TextAlign.justify,
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
                          style: positionText,
                        )),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 65),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 600,
                  child: Image.asset(
                    pic,
                    //height: 100,
                    alignment: Alignment.topLeft,
                    width: 300,
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
                    child: Image.asset(
                      "images/$name${itemIndex + 1}.jpeg",
                      fit: BoxFit.fill,
                    ),
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
