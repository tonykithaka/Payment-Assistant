import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_assistant/screens/beneficiaries.dart';
import 'package:payment_assistant/screens/profile.dart';
import 'package:payment_assistant/screens/statements.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';
import 'package:payment_assistant/ui_components/home_carousel.dart';
import 'package:page_transition/page_transition.dart';

import 'billers.dart';
import 'login.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  double navLinkWidth = SizeConfig.blockSizeHorizontal * 22;
  int buttonIndex = 0;
  bool itemOne = true;
  bool itemTwo = false;
  bool itemThree = false;
  bool itemFour = false;

  void pageChanged(int index) {
    print("selected page : " + index.toString());
    setState(() {
      buttonIndex = index;
    });
    switch (index) {
      case 0:
        {
          setState(() {
            this.itemOne = true;
            this.itemTwo = false;
            this.itemThree = false;
            this.itemFour = false;
          });
        }
        break;

      case 1:
        {
          setState(() {
            this.itemOne = false;
            this.itemTwo = true;
            this.itemThree = false;
            this.itemFour = false;
          });
        }
        break;

      case 2:
        {
          setState(() {
            this.itemOne = false;
            this.itemTwo = false;
            this.itemThree = true;
            this.itemFour = false;
          });
        }
        break;

      case 3:
        {
          setState(() {
            this.itemOne = false;
            this.itemTwo = false;
            this.itemThree = false;
            this.itemFour = true;
          });
        }
        break;

      default:
        {
          setState(() {
            this.itemOne = true;
            this.itemTwo = false;
            this.itemThree = false;
            this.itemFour = false;
          });
        }
        break;
    }
  }

  void bottomTapped(int index) {
    switch (index) {
      case 0:
        {
          setState(() {
            this.itemOne = true;
            this.itemTwo = false;
            this.itemThree = false;
            this.itemFour = false;
          });
        }
        break;

      case 1:
        {
          setState(() {
            this.itemOne = false;
            this.itemTwo = true;
            this.itemThree = false;
            this.itemFour = false;
          });
        }
        break;

      case 2:
        {
          setState(() {
            this.itemOne = false;
            this.itemTwo = false;
            this.itemThree = true;
            this.itemFour = false;
          });
        }
        break;

      case 3:
        {
          setState(() {
            this.itemOne = false;
            this.itemTwo = false;
            this.itemThree = false;
            this.itemFour = true;
          });
        }
        break;

      default:
        {
          setState(() {
            this.itemOne = true;
            this.itemTwo = false;
            this.itemThree = false;
            this.itemFour = false;
          });
        }
        break;
    }
    pageController.animateToPage(index,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 500));
    setState(() {
      buttonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF000000).withOpacity(1.0),
      ),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: mainBackgroundColor,
          child: Column(
            children: [
              CustomAppBar(),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    pageChanged(index);
                  },
                  children: [
                    Column(
                      children: [
                        NameTag(),
                        MyBillers(),
                        Stack(
                          // alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 0),
                                  height: SizeConfig.blockSizeVertical * 52,
                                  color: mainBackgroundColor,
                                  child: Wheel(),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.blockSizeVertical * 0),
                                    child: Text(
                                      'Swipe Up',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black.withOpacity(0.3),
                                          fontSize: 15.0),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Statements(),
                    Beneficiaries(),
                    Profile()
                  ],
                  //
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: SizeConfig.blockSizeVertical * 9,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 6),
            // color: Colors.black,
            child: Transform.translate(
              offset: const Offset(0.0, -1.0),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: navLinkWidth * buttonIndex,
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 0),
                      width: navLinkWidth,
                      height: navLinkWidth,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //       image: this.itemTwo
                      //           ? AssetImage(
                      //               "images/button_background_white.png")
                      //           : AssetImage("images/button_background.png"),
                      //       fit: BoxFit.contain,
                      //       alignment: Alignment.topCenter),
                      // ),
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        firstChild:
                            Image.asset('images/button_background_white.png'),
                        secondChild:
                            Image.asset('images/button_background.png'),
                        crossFadeState: this.itemTwo
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            bottomTapped(0);
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: navLinkWidth,
                            height: navLinkWidth,
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                  top: this.itemOne
                                      ? SizeConfig.blockSizeVertical * 1.5
                                      : SizeConfig.blockSizeVertical * 3.1,
                                  child: Icon(
                                    Icons.home_rounded,
                                    size: this.itemOne
                                        ? SizeConfig.blockSizeVertical * 4.0
                                        : SizeConfig.blockSizeVertical * 2.5,
                                    color: this.itemOne
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          bottomTapped(1);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: navLinkWidth,
                          height: navLinkWidth,
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                top: this.itemTwo
                                    ? SizeConfig.blockSizeVertical * 1.5
                                    : SizeConfig.blockSizeVertical * 3.2,
                                child: Icon(
                                  Icons.menu,
                                  size: this.itemTwo
                                      ? SizeConfig.blockSizeVertical * 4.0
                                      : SizeConfig.blockSizeVertical * 2.5,
                                  color: this.itemTwo
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bottomTapped(2);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: navLinkWidth,
                          height: navLinkWidth,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                top: this.itemThree
                                    ? SizeConfig.blockSizeVertical * 1.5
                                    : SizeConfig.blockSizeVertical * 3.2,
                                child: Icon(
                                  Icons.crop_square_rounded,
                                  size: this.itemThree
                                      ? SizeConfig.blockSizeVertical * 4.0
                                      : SizeConfig.blockSizeVertical * 2.5,
                                  color: this.itemThree
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bottomTapped(3);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: navLinkWidth,
                          height: navLinkWidth,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                top: this.itemFour
                                    ? SizeConfig.blockSizeVertical * 1.5
                                    : SizeConfig.blockSizeVertical * 3.2,
                                child: Icon(
                                  Icons.account_circle_sharp,
                                  size: this.itemFour
                                      ? SizeConfig.blockSizeVertical * 3.5
                                      : SizeConfig.blockSizeVertical * 2.5,
                                  color: this.itemFour
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: SizeConfig.blockSizeVertical * 12,
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 9,
          right: SizeConfig.safeBlockHorizontal * 9,
        ),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Container(
                alignment: Alignment.centerLeft,
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeVertical * 5,
                child: Image.asset(
                  'images/menu_icon.png',
                  height: SizeConfig.blockSizeVertical * 1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              child: Container(
                alignment: Alignment.centerRight,
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeVertical * 5,
                child: Image.asset(
                  'images/bell.png',
                  height: SizeConfig.blockSizeVertical * 2.8,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NameTag extends StatefulWidget {
  @override
  _NameTagState createState() => _NameTagState();
}

class _NameTagState extends State<NameTag> {
  String userName = 'Antony';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 16,
            vertical: SizeConfig.blockSizeVertical * 4),
        child: Row(
          children: [
            Text(
              'Morning, ',
              style: normalBigTextNormal,
            ),
            Text(
              '$userName!',
              style: normalBigTextBold,
            ),
          ],
        ),
      ),
    );
  }
}

class MyBillers extends StatefulWidget {
  @override
  _MyBillersState createState() => _MyBillersState();
}

class _MyBillersState extends State<MyBillers> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8.5,
            vertical: SizeConfig.blockSizeVertical * 0),
        width: MediaQuery.of(context).size.width,
        height: SizeConfig.blockSizeVertical * 7,
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Billers(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.centerRight,
            height: SizeConfig.blockSizeVertical * 5,
            width: SizeConfig.blockSizeVertical * 5,
            child: Image.asset(
              'images/settings-work-tool@2x.png',
              height: SizeConfig.blockSizeVertical * 2.7,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
