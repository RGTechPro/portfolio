import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'dart:html' as html;
import 'package:dots_indicator/dots_indicator.dart';

import '../models/skillChip.dart';

class SkillCard extends StatelessWidget {
  SkillCard({
    required this.skills,
  });

  List<SkillChip> skills;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // screen width

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                children: skills!
                    .map((i) => Padding(
                          padding: const EdgeInsets.only(right: 30, top: 30),
                          child: Chip(
                              avatar: i.icon,
                              labelPadding: EdgeInsets.all(5),
                              labelStyle: descriptionText,
                              backgroundColor: Color(0xff282b38),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.white)),
                              label: Text(
                                i.skill,
                                style: descriptionText.copyWith(fontSize: 25),
                              )),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

