import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../models/skillChip.dart';

class SkillCard extends StatelessWidget {
  SkillCard({
    required this.skills,
  });

  List<SkillChip> skills;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // screen width

    double screenHeight = MediaQuery.of(context).size.height; // screen width

    return Padding(
      padding: EdgeInsets.only(
          top: 0.012 * screenWidth,
          left: screenWidth * 0.01,
          right: screenWidth * 0.01),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                children: skills!
                    .map((i) => Padding(
                          padding: EdgeInsets.only(
                              right: ResponsiveValue(context,
                                  defaultValue: 30.0,
                                  valueWhen: [
                          const          Condition.smallerThan(
                                        name: TABLET, value: 15.0),
                            const        Condition.smallerThan(
                                        name: MOBILE, value: 17.5)
                                  ]).value!,
                              top: ResponsiveValue(context,
                                  defaultValue: 30.0,
                                  valueWhen: [
                             const       Condition.smallerThan(
                                        name: TABLET, value: 15.0),
                             const       Condition.smallerThan(
                                        name: MOBILE, value: 17.5)
                                  ]).value!),
                          child: Chip(
                              avatar: i.icon,
                              labelPadding:const EdgeInsets.all(5),
                              labelStyle: descriptionText,
                              backgroundColor:const Color(0xff282b38),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side:const BorderSide(color: Colors.white)),
                              label: Text(
                                i.skill,
                                style: descriptionText.copyWith(
                                    fontSize: ResponsiveValue(context,
                                        defaultValue: screenWidth * 0.01736,
                                        valueWhen: [
                                    const  Condition.smallerThan(
                                          name: MOBILE, value: 19.0)
                                    ]).value!),
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
