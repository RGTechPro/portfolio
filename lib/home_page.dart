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

import 'models/skillChip.dart';

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
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // screen width
    double screenPad =
        screenWidth * 0.01; // screen padding for swiping between pages
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
                    padding: const EdgeInsets.only(right: 40, top: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue'),
                              )),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('About',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Neue')),
                          style: ButtonStyle(),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('Works',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Neue'))),
                        TextButton(
                            onPressed: () {},
                            child: Text('Contact',
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
          body: PageView(
            //pageSnapping: false,
            scrollDirection: Axis.vertical,
            controller: PageController(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 150, top: 50),
                      child: SizedBox(
                        width: 50,
                        height: 500,
                        child: Stack(children: [
                          Positioned(
                            left: 70,
                            child: ClipPath(
                              clipper: CustomClipperImage(),
                              child: Container(
                                height: 450,
                                child: Image.asset(
                                  'images/my_photo.png',
                                  //height: 100,
                                  alignment: Alignment.topLeft,
                                  width: 350,
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
                            left: 330,
                            child: SizedBox(
                              width: 150,
                              child: Text('Rishabh Gupta.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 330,
                            left: 350,
                            child: SizedBox(
                              width: 150,
                              child: Text('15',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 405,
                            left: 385,
                            child: SizedBox(
                              width: 150,
                              child: Text('Projects',
                                  style: TextStyle(
                                      color: Color(0xff04c189),
                                      fontFamily: 'Neue',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 205,
                            // left: 315,
                            child: SizedBox(
                              width: 150,
                              child: Text('523+',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neue',
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 265,
                            left: 85,
                            child: SizedBox(
                              width: 150,
                              child: Text('Days',
                                  style: TextStyle(
                                      color: Color(0xff04c189),
                                      fontFamily: 'Neue',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Positioned(
                            top: 415,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 170.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 75,
                          ),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Flutter & Cloud Developer,\nTurning your idea into\ncool product.',
                              style: TextStyle(
                                letterSpacing: 1.75,
                                // textBaseline: TextBaseline.alphabetic,
                                color: Colors.white,
                                fontFamily: 'Neue',
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'I am Rishabh, experienced Flutter & Cloud Developer. I am here to help you build your amazing product!',
                              style: TextStyle(
                                // textBaseline: TextBaseline.alphabetic,
                                color: Color(0xff92949E),
                                fontFamily: 'Neue',
                                fontSize: 22,
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
                                      onPressed: () {},
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
                                        'Contact Me',
                                        style: TextStyle(color: Colors.white),
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
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          )
                        ],
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
                                  style: aboutMeText.copyWith(fontSize: mFont),
                                  children: <TextSpan>[
                                    TextSpan(text: "Hi, I'm a "),
                                    TextSpan(
                                        text: "third-year ",
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
                                        text: ' and become a finalist at the ',
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
                                        name: TABLET, value: screenWidth * 0.3),
                                    Condition.smallerThan(
                                        name: MOBILE, value: 340.0),
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
                              Condition.smallerThan(name: DESKTOP, value: 25.0),
                              Condition.smallerThan(name: MOBILE, value: 32.0),
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
                          )
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
                          dotsCount: 2,
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
                              Condition.smallerThan(name: DESKTOP, value: 25.0),
                              Condition.smallerThan(name: MOBILE, value: 32.0),
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
                          )
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
                          dotsCount: 2,
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
                              Condition.smallerThan(name: DESKTOP, value: 25.0),
                              Condition.smallerThan(name: MOBILE, value: 32.0),
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
                                'Mera Aadhaar is a mobile App that gives the user the power to book a preferred operator on his phone in the preferred time slot and perform operations like Aadhaar Card updation and enrollment at the comfort of their home. I along with my team, won the first position in the Smart India Hackathon 2022 through this project, organized by the Government of India and also won a cash prize of rupees 1 Lakh.',
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
                            pic: 'images/jdms.webp',
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
                          dotsCount: 2,
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
                      return Text('Loading');
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
                                      name: DESKTOP, value: screenWidth * 0.04),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
