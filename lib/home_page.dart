import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widgets/ach_card.dart';
import 'package:portfolio/widgets/blog_card.dart';
import 'package:portfolio/widgets/edu_card.dart';
import 'package:portfolio/widgets/pro_card.dart';
import 'package:portfolio/widgets/skill_card.dart';
import 'package:portfolio/widgets/work_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dev_icons/dev_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:html' as html;
import 'models/skillChip.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade: 0.2, double scale: 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double position = info.position!;
    double scaleFactor = (1 - position.abs()) * (1 - _scale);
    double fadeFactor = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFactor;
    double scale = _scale + scaleFactor;
    return new Opacity(
      opacity: opacity,
      child: new Transform.scale(
        scale: scale,
        child: item,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final GColors = [Color(0xff282b38), Color.fromARGB(255, 67, 71, 88)];
  int _currentPosition_work = 0;
  int _currentPosition_ach = 0;
  int _currentPosition_pro = 0;
  int _currentPosition_blog = 0;
  int _currentPosition_edu = 0;
  PageController workPage = PageController();
  PageController achPage = PageController();
  PageController proPage = PageController();
  PageController blogPage = PageController();
  PageController eduPage = PageController();
  TransformerPageController mainPage = TransformerPageController(itemCount: 8);
  IndexController indexController = IndexController();
  final String readCounters = """
  query{
  user(username:"rgpro") {
    publication {
      posts(page:0) {
        title
        brief
        slug
        coverImage
        dateAdded
        
      }
    }
  }
}
""";
  int index = 0;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // screen width
    double screenPad = screenWidth * 0.01;
    // screen padding for swiping between pages
    workPage = PageController(
        initialPage: 0, viewportFraction: 1 + (screenPad * 2 / screenWidth));
    achPage = PageController(
        initialPage: 0, viewportFraction: 1 + (screenPad * 2 / screenWidth));
    proPage = PageController(
        initialPage: 0, viewportFraction: 1 + (screenPad * 2 / screenWidth));
    blogPage = PageController(
        initialPage: 0, viewportFraction: 1 + (screenPad * 2 / screenWidth));
    eduPage = PageController(
        initialPage: 0, viewportFraction: 1 + (screenPad * 2 / screenWidth));
    double mFont = ResponsiveValue(context,
        defaultValue: screenWidth * 0.01736,
        valueWhen: [
          Condition.smallerThan(name: DESKTOP, value: 17.7),
          Condition.smallerThan(name: TABLET, value: 16.2),
          Condition.smallerThan(name: MOBILE, value: 18.0),
        ]).value!;

    int flex1 = 1;
    int flex2 = 1;
    if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      flex1 = 4;
      flex2 = 3;
    }
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      flex1 = 3;
      flex2 = 4;
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: GColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 40, top: 30),
                child: Row(
                  children: [
                    Text(
                      'Rishabh ',
                      style: TextStyle(fontFamily: 'Neue'),
                    ),
                    Text(
                      'Gupta',
                      style: TextStyle(
                          fontFamily: 'Neue', color: Color(0xff04c189)),
                    ),
                    Text(
                      '.',
                      style: TextStyle(fontFamily: 'Neue'),
                    ),
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40, top: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                mainPage.jumpToPage(0);
                              },
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue'),
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            mainPage.jumpToPage(1);
                          },
                          child: Text('About',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Neue')),
                          style: ButtonStyle(),
                        ),
                        TextButton(
                            onPressed: () {
                              mainPage.jumpToPage(5);
                            },
                            child: Text('Works',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue'))),
                        TextButton(
                            onPressed: () {
                              mainPage.jumpToPage(6);
                            },
                            child: Text('Blogs',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue')))
                      ],
                    ),
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          body: Scrollbar(
            controller: mainPage,
            child: TransformerPageView.children(
              transformer: ScaleAndFadeTransformer(),
              //pageSnapping: false,
              //physics: ScrollPhysics(),
              onPageChanged: (value) {
                index = value!;
              },
              index: index,
              controller: indexController,
              scrollDirection: Axis.vertical,
              pageController: mainPage,
              children: [
                ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowCrossAxisAlignment: CrossAxisAlignment.start,
                  columnMainAxisAlignment: MainAxisAlignment.center,
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      columnOrder: 1073741822,
                      child: Expanded(
                        flex: flex1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: ResponsiveValue(context,
                                  defaultValue: screenWidth * .04,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP, value: screenWidth * .03)
                                  ]).value!,
                              top: 50),
                          child: SizedBox(
                            // width: 50,
                            height: 500,
                            child: Stack(children: [
                              Positioned(
                                left: 70,
                                child: ClipPath(
                                  clipper: !ResponsiveWrapper.of(context)
                                          .isSmallerThan(DESKTOP)
                                      ? CustomClipperImage()
                                      : CustomClipperImage2(),
                                  child: Container(
                                    height: ResponsiveValue(context,
                                        defaultValue: 450.0,
                                        valueWhen: [
                                          Condition.smallerThan(
                                              name: DESKTOP, value: 320.0)
                                        ]).value, //450
                                    child: Image.asset(
                                      'images/my_photo.png',
                                      //height: 100,
                                      alignment: Alignment.topLeft,
                                      width: ResponsiveValue(context,
                                          defaultValue: 350.0,
                                          valueWhen: [
                                            Condition.smallerThan(
                                                name: DESKTOP, value: 250.0)
                                          ]).value,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Color(0xff252734)),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                left: ResponsiveValue(context,
                                    defaultValue: 330.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 260.0)
                                    ]).value,
                                child: SizedBox(
                                  width: 150,
                                  child: Text('Rishabh Gupta.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Neue',
                                          fontSize: ResponsiveValue(context,
                                              defaultValue: 38.0,
                                              valueWhen: [
                                                Condition.smallerThan(
                                                    name: DESKTOP, value: 24.0)
                                              ]).value,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Positioned(
                                top: ResponsiveValue(context,
                                    defaultValue: 330.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 235.0)
                                    ]).value,
                                left: ResponsiveValue(context,
                                    defaultValue: 350.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 270.0)
                                    ]).value,
                                child: SizedBox(
                                  width: 150,
                                  child: Text('15',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Neue',
                                          fontSize: ResponsiveValue(context,
                                              defaultValue: 80.0,
                                              valueWhen: [
                                                Condition.smallerThan(
                                                    name: DESKTOP, value: 50.0)
                                              ]).value,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Positioned(
                                top: ResponsiveValue(context,
                                    defaultValue: 405.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 282.0)
                                    ]).value,
                                left: ResponsiveValue(context,
                                    defaultValue: 375.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 290.0)
                                    ]).value,
                                child: SizedBox(
                                  width: 150,
                                  child: Text('Projects',
                                      style: TextStyle(
                                          color: Color(0xff04c189),
                                          fontFamily: 'Neue',
                                          fontSize: ResponsiveValue(context,
                                              defaultValue: 25.0,
                                              valueWhen: [
                                                Condition.smallerThan(
                                                    name: DESKTOP, value: 20.0)
                                              ]).value,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Positioned(
                                top: ResponsiveValue(context,
                                    defaultValue: 205.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 150.0)
                                    ]).value,
                                // left: 315,
                                left: ResponsiveValue(context,
                                    defaultValue: 0.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 40.0)
                                    ]).value,
                                child: SizedBox(
                                  width: 150,
                                  child: Text('867+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Neue',
                                          fontSize: ResponsiveValue(context,
                                              defaultValue: 60.0,
                                              valueWhen: [
                                                Condition.smallerThan(
                                                    name: DESKTOP, value: 35.0)
                                              ]).value,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Positioned(
                                top: ResponsiveValue(context,
                                    defaultValue: 265.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 190.0)
                                    ]).value,
                                left: ResponsiveValue(context,
                                    defaultValue: 85.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 85.0)
                                    ]).value,
                                child: SizedBox(
                                  width: 150,
                                  child: Text('Days',
                                      style: TextStyle(
                                          color: Color(0xff04c189),
                                          fontFamily: 'Neue',
                                          fontSize: ResponsiveValue(context,
                                              defaultValue: 30.0,
                                              valueWhen: [
                                                Condition.smallerThan(
                                                    name: DESKTOP, value: 20.0)
                                              ]).value,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Positioned(
                                top: ResponsiveValue(context,
                                    defaultValue: 415.0,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 295.0)
                                    ]).value,
                                left: 70,
                                child: SizedBox(
                                  width: 300,
                                  child: Text('SOFTWARE  DEVELOPER',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Neue',
                                        fontSize: 15,
                                      )),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: Expanded(
                        flex: flex2,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: ResponsiveValue(context,
                                defaultValue: screenWidth * .035,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: DESKTOP, value: screenWidth * .03),
                                  Condition.smallerThan(
                                      name: TABLET, value: 40.0)
                                ]).value!,
                            left: ResponsiveValue(context,
                                defaultValue: 0.0,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: TABLET, value: 40.0)
                                ]).value!,
                          ),
                          child: Column(
                            crossAxisAlignment: !ResponsiveWrapper.of(context)
                                    .isSmallerThan(TABLET)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              if (!ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET))
                                SizedBox(
                                  height: 75,
                                ),
                              if (ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET))
                                SizedBox(
                                  height: 20,
                                ),
                              if (!ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET))
                                SizedBox(
                                  //width: 10,
                                  height: 75,
                                  child: CircularText(radius: 50, children: [
                                    TextItem(
                                      startAngle: 210,
                                      space: 17,
                                      text: Text('FLUTTER & CLOUD DEV',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Neue',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    TextItem(
                                        startAngle: -177,
                                        space: 17,
                                        text: Text(
                                          '•',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              // textBaseline: TextBaseline.alphabetic,
                                              color: Color(0xff04c189),
                                              fontFamily: 'Neue',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ]),
                                ),
                              if (!ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET))
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Flutter & Cloud Developer,\nTurning your idea into\ncool product.',
                                    style: TextStyle(
                                      letterSpacing: 1.75,
                                      // textBaseline: TextBaseline.alphabetic,
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: ResponsiveValue(context,
                                          defaultValue: screenWidth * 0.0278,
                                          valueWhen: [
                                            Condition.smallerThan(
                                                name: DESKTOP,
                                                value: screenWidth * 0.0278)
                                          ]).value,
                                    ),
                                  ),
                                ),
                              if (ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET))
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      //width: 10,
                                      height: 75,
                                      child:
                                          CircularText(radius: 50, children: [
                                        TextItem(
                                          startAngle: 210,
                                          space: 17,
                                          text: Text('FLUTTER & CLOUD DEV',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Neue',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        TextItem(
                                            startAngle: -177,
                                            space: 17,
                                            text: Text(
                                              '•',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  // textBaseline: TextBaseline.alphabetic,
                                                  color: Color(0xff04c189),
                                                  fontFamily: 'Neue',
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ]),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Flutter & Cloud Developer,\nTurning your idea into\ncool product.',
                                        style: TextStyle(
                                          letterSpacing: 1.75,
                                          // textBaseline: TextBaseline.alphabetic,
                                          color: Colors.white,
                                          fontFamily: 'Neue',
                                          fontSize: ResponsiveValue(context,
                                              defaultValue:
                                                  screenWidth * 0.0278,
                                              valueWhen: [
                                                Condition.smallerThan(
                                                    name: DESKTOP,
                                                    value: screenWidth * 0.0278)
                                              ]).value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'I am Rishabh, experienced Flutter & Cloud Developer. I am here to help you build your amazing product!',
                                  style: TextStyle(
                                    // textBaseline: TextBaseline.alphabetic,
                                    color: Color(0xff92949E),
                                    fontFamily: 'Neue',
                                    fontSize: ResponsiveValue(context,
                                        defaultValue: screenWidth * 0.0153,
                                        valueWhen: [
                                          Condition.smallerThan(
                                              name: DESKTOP,
                                              value: screenWidth * 0.0153),
                                          Condition.smallerThan(
                                              name: TABLET, value: 17.0)
                                        ]).value,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: 115,
                                      child: TextButton(
                                          onPressed: () {
                                            html.window.open(
                                                'mailto:rgupta4_be20@thapar.edu',
                                                "_blank");
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                                // side: BorderSide(color: Colors.red)
                                              )),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xff00CC8E))),
                                          child: Text(
                                            'Mail Me',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.twitter,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        html.window.open(
                                            'https://twitter.com/RishabhDevGuy',
                                            "_blank");
                                      },
                                    ),
                                    IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        html.window.open(
                                            'https://www.instagram.com/techie_rishabh/',
                                            "_blank");
                                      },
                                    ),
                                    IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.linkedin,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        html.window.open(
                                            'https://www.linkedin.com/in/rgpro/',
                                            "_blank");
                                      },
                                    ),
                                    IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.github,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        html.window.open(
                                            'https://github.com/RGTechPro',
                                            "_blank");
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.068,
                          valueWhen: [
                        Condition.smallerThan(
                            name: DESKTOP, value: screenWidth * 0.04),
                      ]).value!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7.0),
                        child: Text('About Me', style: topicHeading),
                      ),
                      ResponsiveRowColumn(
                        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                        columnCrossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.baseline,
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Container(
                                width: ResponsiveValue(context,
                                    defaultValue: screenWidth * 0.544,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP, value: 800.0)
                                    ]).value,
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style:
                                        aboutMeText.copyWith(fontSize: mFont),
                                    children: <TextSpan>[
                                      TextSpan(text: "Hi, I'm a "),
                                      TextSpan(
                                          text: "final-year ",
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: 'undergraduate at ',
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text:
                                              'Thapar Institute of Engineering & Technology',
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: ", and I've been a ",
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: 'Flutter Developer',
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text:
                                              " for two years. I'm enthusiastic about ",
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: 'DevOps',
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text:
                                              ' and enjoy building new things. My passion for innovation has led me to win the ',
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: 'Smart India Hackathon',
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text:
                                              ' and become a finalist at the ',
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: 'UNSECO India Africa Hackathon',
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text:
                                              ". As a developer, I have a deep understanding of the latest technologies, tools, and best practices in mobile app development. My focus on providing the best user experience has allowed me to develop apps that have received ",
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text: 'great feedback ',
                                          style: aboutMeText2.copyWith(
                                              fontSize: mFont)),
                                      TextSpan(
                                          text:
                                              "from clients and users alike. I'm always eager to explore new tools and technologies that can help streamline the development and deployment process.",
                                          style: aboutMeText.copyWith(
                                              fontSize: mFont))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            columnOrder: 1073741822,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: ResponsiveValue(context,
                                    defaultValue: screenWidth * 0.3125,
                                    valueWhen: [
                                      Condition.smallerThan(
                                          name: DESKTOP,
                                          value: screenWidth * 0.275),
                                      Condition.smallerThan(
                                          name: TABLET,
                                          value: screenWidth * 0.3),
                                      Condition.smallerThan(
                                          name: MOBILE, value: 315.0),
                                    ]).value, //450
                                child: Image.asset(
                                  'images/my_photo.png',
                                  //height: 100,
                                  alignment: Alignment.topLeft,
                                  width: ResponsiveValue(context,
                                      defaultValue: screenWidth * 0.260,
                                      valueWhen: [
                                        Condition.smallerThan(
                                            name: DESKTOP,
                                            value: screenWidth * 0.23),
                                        Condition.smallerThan(
                                            name: TABLET,
                                            value: screenWidth * 0.275),
                                        Condition.smallerThan(
                                            name: MOBILE, value: 270.0),
                                      ]).value //375,
                                  ,
                                  fit: BoxFit.fitWidth,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Color(0xff252734)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.068,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.04),
                          ]).value!,
                      vertical: screenWidth * 0.0104),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Skills', style: topicHeading),
                      Expanded(
                        child: SkillCard(
                          skills: [
                            SkillChip(
                                skill: 'Flutter',
                                icon: Icon(
                                  DevIcons.flutterPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Firebase',
                                icon: Icon(
                                  DevIcons.firebasePlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Node.js',
                                icon: Icon(
                                  DevIcons.nodejsPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Python',
                                icon: Icon(
                                  DevIcons.pythonPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Bash',
                                icon: Icon(
                                  DevIcons.bashPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Dart',
                                icon: Icon(
                                  DevIcons.dartPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'SQL',
                                icon: Icon(
                                  DevIcons.mysqlPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'MongoDB',
                                icon: Icon(
                                  DevIcons.mongodbPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'GoLang',
                                icon: Icon(
                                  DevIcons.goPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'GraphQL',
                                icon: Icon(
                                  DevIcons.graphqlPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'C/C++',
                                icon: Icon(
                                  DevIcons.cplusplusPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'HTML',
                                icon: Icon(
                                  DevIcons.html5Plain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'CSS',
                                icon: Icon(
                                  DevIcons.css3Plain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Javascript',
                                icon: Icon(
                                  DevIcons.javascriptPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'AWS',
                                icon: Icon(
                                  DevIcons.amazonwebservicesOriginal,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Docker',
                                icon: Icon(
                                  DevIcons.dockerPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Android',
                                icon: Icon(
                                  DevIcons.androidPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Swift',
                                icon: Icon(
                                  DevIcons.swiftPlain,
                                  color: Color(0xff04c189),
                                )),

                            SkillChip(
                                skill: 'Git',
                                icon: Icon(
                                  DevIcons.gitPlain,
                                  color: Color(0xff04c189),
                                )),
                            //   SkillChip(skill: 'Latex', icon: Icon(DevIcons)),
                            SkillChip(
                                skill: 'Kubernetes',
                                icon: Icon(
                                  DevIcons.kubernetesPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'GCP',
                                icon: Icon(
                                  DevIcons.googlecloudPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Django',
                                icon: Icon(
                                  DevIcons.djangoPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Figma',
                                icon: Icon(
                                  DevIcons.figmaPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Jenkins',
                                icon: Icon(
                                  DevIcons.jenkinsPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Nginx',
                                icon: Icon(
                                  DevIcons.nginxOriginal,
                                  color: Color(0xff04c189),
                                )),
                            //    SkillChip(skill: 'Azure', icon: Icon(DevIcons.)),
                            //   SkillChip(skill: 'Solidity', icon: Icon(DevIcons.solid)),
                            SkillChip(
                                skill: 'Java',
                                icon: Icon(
                                  DevIcons.javaPlain,
                                  color: Color(0xff04c189),
                                )),
                            SkillChip(
                                skill: 'Linux',
                                icon: Icon(
                                  DevIcons.linuxPlain,
                                  color: Color(0xff04c189),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.068,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.04),
                          ]).value!,
                      vertical: screenWidth * 0.0104),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Work Experience and Volunteering',
                          style: topicHeading.copyWith(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 35.0,
                                  valueWhen: [
                                Condition.smallerThan(
                                    name: DESKTOP, value: 25.0),
                                Condition.smallerThan(
                                    name: MOBILE, value: 32.0),
                              ]).value!)),
                      Expanded(
                        child: PageView(
                          physics: ScrollPhysics(),
                          controller: workPage,
                          // calculate viewPortFraction
                          onPageChanged: (int value) {
                            setState(() {
                              _currentPosition_work = value;
                              print(_currentPosition_work.toDouble());
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          children: [
                            WorkCard(
                              position: 'FLUTTER DEVELOPER INTERN',
                              company: 'Townsquare',
                              description:
                                  'As a Flutter Developer Intern at Townsquare, I made valuable contributions to the optimization and enhancement of our social media app. I focused on streamlining loading times, optimizing code, and introducing exciting new features. I conducted thorough A/B testing to make informed decisions. Collaborating closely with designers and product managers, I prioritized the development of a seamless user experience. Additionally, I played a key role in implementing a robust and engaging notification system, further enhancing user engagement.',
                              duration: 'May 2023 to June 2023',
                              pic: 'images/townsquare.png',
                              link: 'https://www.townsquare.social/',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'GCP',
                                    icon: Icon(
                                      DevIcons.googlecloudPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                            ),
                            WorkCard(
                              position: 'SOFTWARE DEVELOPER INTERN',
                              company: 'Housy',
                              description:
                                  'Worked as a Software Development Intern at Housy and handled the app development of their app. Integrated payment system. Created, implemented, and documented the source code for mobile/web applications at Housy. Performed unit and integration, beta, and A/B testing before launch. Conducted functional and non-functional testing. Fixed multiple bugs. Implemented new features for meeting the business model requirements. Brought new changes in the UI. Learnt iOS app deployment on App Store Connect.',
                              duration: 'Feb 2022 to June 2022',
                              pic: 'images/housy.png',
                              link: 'https://www.housyforyou.com/',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                            ),
                            WorkCard(
                              position: 'EXECUTIVE MEMBER',
                              company: 'MLSC',
                              description:
                                  "As the Technical Coordinator for Makeathon 4.0 (Hackathon), I successfully organized and facilitated the event, ensuring its smooth execution. Achieved first rank in the coding competition 'Thapar Premier League', representing MLSC at TIET. Secured the first position in 'Ideathon' by pitching 'Clobofy', a solution for buying/selling used clothes and books. Conducted a workshop on Cyber Security in Tech Meet 2021 and coordinated a team for Quarter Quell as part of the organizing committee.",
                              duration: 'Oct 2020 to June 2022',
                              pic: 'images/mlsc.png',
                              link: 'https://mlsctiet.com/',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'HTML',
                                    icon: Icon(
                                      DevIcons.html5Plain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'CSS',
                                    icon: Icon(
                                      DevIcons.css3Plain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Javascript',
                                    icon: Icon(
                                      DevIcons.javascriptPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Django',
                                    icon: Icon(
                                      DevIcons.djangoPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  workPage.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: _currentPosition_work.toDouble(),
                            decorator: DotsDecorator(
                              activeColor: Color(0xff04c189),
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  workPage.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.068,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.04),
                          ]).value!,
                      vertical: screenWidth * 0.0104),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Achievements',
                          style: topicHeading.copyWith(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 35.0,
                                  valueWhen: [
                                Condition.smallerThan(
                                    name: DESKTOP, value: 25.0),
                                Condition.smallerThan(
                                    name: MOBILE, value: 32.0),
                              ]).value!)),
                      Expanded(
                        child: PageView(
                          physics: ScrollPhysics(),
                          controller: achPage, // calculate viewPortFraction
                          onPageChanged: (int value) {
                            setState(() {
                              _currentPosition_ach = value;
                              print(_currentPosition_ach.toDouble());
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          children: [
                            AchCard(
                              position: 'WINNER',
                              competition: 'Smart India Hackathon 2022',
                              description:
                                  'I along with my team, won the first position in the Smart India Hackathon 2022, organized by the Government of India and also won a cash prize of rupees 1 Lakh. We had to create a solution for a problem statement given by the Ministry of Electronics and Information Technology (MEITY). We created MeraAadhar. MeraAadhaar is a mobile App that gives the user the power to book a preferred operator on his phone in the preferred time slot and perform operations like Aadhaar Card updation and enrollment at the comfort of their home.',
                              time: 'Aug 2022',
                              pic: 'images/sih.jpeg',
                              link1: 'https://www.sih.gov.in/',
                              link2: 'https://github.com/wersharks/mera_aadhar',
                              link3:
                                  'https://www.linkedin.com/posts/rgpro_sih-sih2022-smartindiahackathon-activity-6970396204174061568-CN5y?utm_source=share&utm_medium=member_desktop',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.0163265,
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                      // size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Django',
                                    icon: Icon(
                                      DevIcons.djangoPlain,
                                      color: Color(0xff04c189),
                                      // size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'React',
                                    icon: Icon(
                                      DevIcons.reactOriginal,
                                      color: Color(0xff04c189),
                                      // size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'AWS',
                                    icon: Icon(
                                      DevIcons.amazonwebservicesOriginal,
                                      //size: screenWidth*0.016,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Docker',
                                    icon: Icon(
                                      DevIcons.dockerPlain,
                                      //size: screenWidth*0.016,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                            ),
                            AchCard(
                              position: 'GRAND FINALIST',
                              competition: 'UNESCO India Africa Hackathon',
                              description:
                                  'After two rounds of elimination I got a chance to attend this huge event organized by Indian Govt and UNESCO with impeccable arrangements and experience. A chance to blend in and experience numerous cultures with an exchange of Technical Knowledge. We “CodeX” worked on an Education category problem to develop an app for data collection, analysis and visualization related to Schools in order to improve the education system. Vice President of India, UP CM, UP Governer and Education Minister were Chief Guests of this event.',
                              time: 'Nov 2022',
                              pic: 'images/uia.jpeg',
                              link1: 'https://uia.mic.gov.in/',
                              link2: 'https://github.com/RGTechPro/learn_ai',
                              link3:
                                  'https://www.linkedin.com/posts/rgpro_unesco-unescoindiaafricahackathon-vicepresident-activity-7004025965924233216-0avi?utm_source=share&utm_medium=member_desktop',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Django',
                                    icon: Icon(
                                      DevIcons.djangoPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'React',
                                    icon: Icon(
                                      DevIcons.reactOriginal,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'AWS',
                                    icon: Icon(
                                      DevIcons.amazonwebservicesOriginal,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Docker',
                                    icon: Icon(
                                      DevIcons.dockerPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                            ),
                            AchCard(
                              position: 'WINNER',
                              competition: 'HACKTU 4.0 (Fampay Track)',
                              description:
                                  'Our team emerged as the champion in the Fampay track of the prestigious HACKTU 4.0 hackathon, organized by CCS, a renowned technical society. We were tasked with addressing a problem statement put forth by Fampay, a well-known startup. Our solution involved developing an intuitive mobile application designed to enhance financial literacy among individuals. By leveraging our expertise, we crafted a visually appealing user interface and incorporated a comprehensive set of features into the app. Our exceptional solution propelled us to secure the first position in our track.',
                              time: 'Feb 2023',
                              pic: 'images/hacktu.png',
                              link1: 'https://hacktu.ccstiet.com/',
                              link2: 'https://github.com/wersharks/finfy',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.0163265,
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                      // size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                      //size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'Django',
                                    icon: Icon(
                                      DevIcons.djangoPlain,
                                      color: Color(0xff04c189),
                                      // size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'React',
                                    icon: Icon(
                                      DevIcons.reactOriginal,
                                      color: Color(0xff04c189),
                                      // size: screenWidth*0.016,
                                    )),
                                SkillChip(
                                    skill: 'AWS',
                                    icon: Icon(
                                      DevIcons.amazonwebservicesOriginal,
                                      //size: screenWidth*0.016,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Docker',
                                    icon: Icon(
                                      DevIcons.dockerPlain,
                                      //size: screenWidth*0.016,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  achPage.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                          DotsIndicator(
                            dotsCount: 3,
                            position: _currentPosition_ach.toDouble(),
                            decorator: DotsDecorator(
                              activeColor: Color(0xff04c189),
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  achPage.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.068,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.04),
                          ]).value!,
                      vertical: screenWidth * 0.0104),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Projects',
                          style: topicHeading.copyWith(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 35.0,
                                  valueWhen: [
                                Condition.smallerThan(
                                    name: DESKTOP, value: 25.0),
                                Condition.smallerThan(
                                    name: MOBILE, value: 32.0),
                              ]).value!)),
                      Expanded(
                        child: PageView(
                          physics: ScrollPhysics(),
                          controller: proPage, // calculate viewPortFraction
                          onPageChanged: (int value) {
                            setState(() {
                              _currentPosition_pro = value;
                              print(_currentPosition_pro.toDouble());
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          children: [
                            ProCard(
                              name: 'MERA AADHAR',
                              description:
                                  'Mera Aadhaar is a mobile App that allows users to book a preferred operator on their phone, choose a convenient time slot, and perform operations such as Aadhaar Card updation and enrollment from the comfort of their home. My team and I secured the first position in the Smart India Hackathon 2022 through this project, organized by the Gov of India, earning a cash prize of ₹1 Lakh.',
                              pic: 'images/MERA AADHAR1.jpeg',
                              link1: 'https://github.com/wersharks/mera_aadhar',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Django',
                                    icon: Icon(
                                      DevIcons.djangoPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'React',
                                    icon: Icon(
                                      DevIcons.reactOriginal,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'AWS',
                                    icon: Icon(
                                      DevIcons.amazonwebservicesOriginal,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Docker',
                                    icon: Icon(
                                      DevIcons.dockerPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                              noi: 14,
                            ),
                            ProCard(
                              name: 'JDMS Pharmacy',
                              description:
                                  'Made a Pharmacy App with Flutter fully integrated with Firebase. This app is currently being used in a city with over 500 users.',
                              pic: 'images/JDMS Pharmacy2.jpeg',
                              link2:
                                  'https://play.google.com/store/apps/details?id=com.jdms.jdms_pharmacy',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Swift',
                                    icon: Icon(
                                      DevIcons.swiftPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Django',
                                    icon: Icon(
                                      DevIcons.djangoPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'AWS',
                                    icon: Icon(
                                      DevIcons.amazonwebservicesOriginal,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                              noi: 8,
                            ),
                            ProCard(
                              name: 'FOODLY (FOOD DELIVERY APP)',
                              description:
                                  'An app for food delivery with catalogues, restaurant details, Veg /Non-veg filtered menu, option to add to cart, view cart,checkout, order summary and order tracking with unique reference id, order Time, invoice. It is fully integrated with firebase.',
                              pic: 'images/FOODLY (FOOD DELIVERY APP)2.jpeg',
                              link1: 'https://github.com/RGTechPro/foodly',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                              noi: 11,
                            ),
                            ProCard(
                              name: 'Do.it ,Smart To-Do App',
                              description:
                                  "A Simple Todo app which has three profiles - Personal, Work and Home with beautiful and smooth UI which enables you to lodge your daily tasks and keep an active track by marking and deleting the completed tasks. The amazing part is that you won't loose your tasks data even if you are using this app on another device beacuse you need to sign in with google at the initial stage. All your tasks are securely stored in the cloud.",
                              pic: 'images/Do.it ,Smart To-Do App1.jpeg',
                              link1:
                                  'https://github.com/RGTechPro/do.it-todo-app-',
                              link2:
                                  'https://play.google.com/store/apps/details?id=com.todo.doit',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                              noi: 11,
                            ),
                            ProCard(
                              name: 'Crippy',
                              description:
                                  "An app for tracking live prices and basic details about most of the cryptocurrencies of the world. This app includes news section which displays latest news related to cryptocurrencies. It is integrated with Coingecko’s API.",
                              pic: 'images/Crippy1.jpeg',
                              link1:
                                  'https://github.com/RGTechPro/crypt-coins-app',
                              link2:
                                  'https://play.google.com/store/apps/details?id=com.crippy.cryptapp',
                              skills: [
                                SkillChip(
                                    skill: 'Flutter',
                                    icon: Icon(
                                      DevIcons.flutterPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Firebase',
                                    icon: Icon(
                                      DevIcons.firebasePlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Node.js',
                                    icon: Icon(
                                      DevIcons.nodejsPlain,
                                      color: Color(0xff04c189),
                                    )),
                                SkillChip(
                                    skill: 'Python',
                                    icon: Icon(
                                      DevIcons.pythonPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                              noi: 3,
                            ),
                            ProCard(
                              name: 'GPT QnA bot',
                              description:
                                  "A bot built on GoLang and integrated with GPT's API that gives short and concise answers of every question.",
                              pic: 'images/GPT QnA bot1.jpeg',
                              link1: 'https://github.com/RGTechPro/gpt-QABot',
                              skills: [
                                SkillChip(
                                    skill: 'GoLang',
                                    icon: Icon(
                                      DevIcons.goPlain,
                                      color: Color(0xff04c189),
                                    )),
                              ],
                              noi: 2,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  proPage.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                          DotsIndicator(
                            dotsCount: 6,
                            position: _currentPosition_pro.toDouble(),
                            decorator: DotsDecorator(
                              activeColor: Color(0xff04c189),
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  proPage.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Query(
                    options: QueryOptions(
                      document: gql(readCounters),
                      pollInterval: Duration(seconds: 10),
                    ),
                    builder: (QueryResult result,
                        {VoidCallback? refetch, FetchMore? fetchMore}) {
                      if (result.hasException) {
                        return Text(result.exception.toString());
                      }

                      if (result.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff04c189),
                          ),
                        );
                      }

                      // it can be either Map or List
                      List data = result.data!['user']['publication']['posts'];

                      print(data);

                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveValue(context,
                                  defaultValue: screenWidth * 0.068,
                                  valueWhen: [
                                    Condition.smallerThan(
                                        name: DESKTOP,
                                        value: screenWidth * 0.04),
                                  ]).value!,
                              vertical: screenWidth * 0.0104),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Blogs', style: topicHeading),
                              Expanded(
                                  child: PageView.builder(
                                physics: ScrollPhysics(),
                                controller:
                                    blogPage, // calculate viewPortFraction
                                onPageChanged: (int value) {
                                  setState(() {
                                    _currentPosition_blog = value;
                                    print(_currentPosition_blog.toDouble());
                                  });
                                },
                                itemCount: data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return BlogCard(
                                    title: data[index]['title'],
                                    brief: data[index]['brief'],
                                    date: data[index]['dateAdded'],
                                    pic: data[index]['coverImage'],
                                    link:
                                        "https://rishabhgupta.hashnode.dev/${data[index]['slug']}",
                                  );
                                },
                              )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7.0),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        iconSize: 22,
                                        onPressed: () {
                                          blogPage.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear);
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.arrowLeft,
                                          color: Color(0xff00CC8E),
                                        )),
                                  ),
                                  DotsIndicator(
                                    dotsCount: data.length,
                                    position: _currentPosition_blog.toDouble(),
                                    decorator: DotsDecorator(
                                      activeColor: Color(0xff04c189),
                                      size: const Size.square(9.0),
                                      activeSize: const Size(18.0, 9.0),
                                      activeShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        iconSize: 22,
                                        onPressed: () {
                                          blogPage.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.linear);
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.arrowRight,
                                          color: Color(0xff00CC8E),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ));
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(context,
                          defaultValue: screenWidth * 0.068,
                          valueWhen: [
                            Condition.smallerThan(
                                name: DESKTOP, value: screenWidth * 0.04),
                          ]).value!,
                      vertical: screenWidth * 0.0104),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Education', style: topicHeading),
                      Expanded(
                        child: PageView(
                          physics: ScrollPhysics(),
                          controller: eduPage,
                          // calculate viewPortFraction
                          onPageChanged: (int value) {
                            setState(() {
                              _currentPosition_edu = value;
                              print(_currentPosition_edu.toDouble());
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          children: [
                            EduCard(
                              collegeName:
                                  'Thapar Institute of Engineering & Technology',
                              description:
                                  'Pursuing B.E. in Computer Engineering',
                              duration: '2020 to 2024',
                              pic: 'images/thapar.webp',
                              link: 'https://www.thapar.edu/',
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  eduPage.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                          DotsIndicator(
                            dotsCount: 1,
                            position: _currentPosition_edu.toDouble(),
                            decorator: DotsDecorator(
                              activeColor: Color(0xff04c189),
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                iconSize: 22,
                                onPressed: () {
                                  eduPage.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Color(0xff00CC8E),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(250.0, 0);
    path.lineTo(250, 100);
    path.lineTo(360, 100);
    path.lineTo(360, 330);
    path.lineTo(275, 330);
    path.lineTo(275, 400);
    path.lineTo(0, 400);
    path.lineTo(0, 300);
    path.lineTo(85, 300);
    path.lineTo(85, 270);
    path.lineTo(70, 270);
    path.lineTo(70, 210);
    path.lineTo(0, 210);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class CustomClipperImage2 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    //450:350   320:250  H:W
    var path = Path();
    path.lineTo(180.0, 0);
    path.lineTo(180, 70);
    path.lineTo(250, 70);
    path.lineTo(250, 235);
    path.lineTo(197, 235);
    path.lineTo(197, 285);
    path.lineTo(0, 285);
    path.lineTo(0, 213);
    path.lineTo(61, 213);
    path.lineTo(61, 192);
    path.lineTo(50, 192);
    path.lineTo(50, 150);
    path.lineTo(0, 150);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

// class CustomPageViewScrollPhysics extends ScrollPhysics {
//   const CustomPageViewScrollPhysics({ScrollPhysics? parent})
//       : super(parent: parent);

//   @override
//   CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
//   }

//   @override
//   SpringDescription get spring => const SpringDescription(
//         mass: 50,
//         stiffness: 50,
//         damping: 0.8,
//       );
// }
