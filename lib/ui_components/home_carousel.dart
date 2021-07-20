import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:payment_assistant/constants/constants.dart';
import 'package:payment_assistant/screens/merchantDetails.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class Wheel extends StatefulWidget {
  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  Axis scrollDirection;
  List<Widget> billerList = [];
  bool checkAndroidPlatform = false;
  List<dynamic> billerListFetched = [];

  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration.zero, () {
    billerListFetched = BILLER_DATA;
    checkPlatform();
    getBillerList();
    // });
  }

  //Get biller list
  void getBillerList() {
    List<Widget> itemsList = [];

    //  Create widget list for revolver cards
    billerListFetched.forEach((biller) {
      var imageUrl = "images/" + biller["image"];
      var containerHeroTag = biller["id"];
      var billerName = biller["name"];
      itemsList.add(RotatedBox(
        quarterTurns: scrollDirection == Axis.horizontal ? 0 : 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: 'container$containerHeroTag',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.black,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1,
                  horizontal: SizeConfig.blockSizeVertical * 1,
                ),
                width: 130,
                height: SizeConfig.blockSizeHorizontal * 64,
              ),
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 50,
              width: 130.0,
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: '$billerName',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    biller["name"],
                    style: normalSliderTextDark,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeHorizontal * 64,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 4,
                  horizontal: SizeConfig.blockSizeHorizontal * 5),
              width: 130,
              child: InkWell(
                onTap: () {
                  setState(() {
                    top = 200;
                  });
                },
                child: Material(
                  color: Colors.transparent,
                  child: Hero(
                    tag: '$imageUrl',
                    child: Image(
                      image: AssetImage(imageUrl),
                      alignment: Alignment.center,
                      width: SizeConfig.blockSizeHorizontal * 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ));
    });
    setState(() {
      billerList = itemsList;
    });
  }

  // check phone paltform
  checkPlatform() {
    if (Platform.isAndroid) {
      setState(() {
        checkAndroidPlatform = true;
      });
    } else if (Platform.isIOS) {
      checkAndroidPlatform = false;
    }
  }

  //Route to biller details page
  merchantRoute(int index) async {
    Navigator.of(context).push(PageRouteBuilder(
      fullscreenDialog: true,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return merchantdetails(billerListFetched[index]);
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity:
              animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
          child: child,
        );
      },
    ));
  }

  double top = 50.0;
  int myIndex = 0;
  int cardIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Column(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 43,
            child: Stack(
              children: [
                GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails dd) {
                    merchantRoute(myIndex);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 60.0,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$cardIndex',
                              style: TextStyle(
                                  fontFamily: 'Impact',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 40.0),
                            ),
                            Text(
                              'of',
                              style: TextStyle(
                                  fontFamily: 'Impact',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 28.0),
                            ),
                            Text(
                              this.billerList.length.toString(),
                              style: TextStyle(
                                  fontFamily: 'Impact',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 40.0),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Container(
                          // color: Colors.blue,
                          padding: checkAndroidPlatform
                              ? EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 2)
                              : EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 5.5),
                          child: RotatedBox(
                            quarterTurns:
                                scrollDirection == Axis.horizontal ? 0 : -1,
                            child: Transform.scale(
                              scale: 1.3,
                              child: ListWheelScrollView.useDelegate(
                                  itemExtent: 130,
                                  diameterRatio:
                                      checkAndroidPlatform ? 0.59 : 0.6,
                                  clipBehavior: Clip.none,
                                  overAndUnderCenterOpacity: 1.0,
                                  offAxisFraction: -0.0,
                                  physics: FixedExtentScrollPhysics(),
                                  squeeze: 1,
                                  renderChildrenOutsideViewport: true,
                                  onSelectedItemChanged: (index) => {
                                        setState(() {
                                          myIndex = index;
                                          cardIndex = index + 1;
                                          print("Current tile is :: " +
                                              myIndex.toString());
                                          print(billerListFetched[index]);
                                        })
                                      },
                                  childDelegate: ListWheelChildListDelegate(
                                    // ListWheelChildLoopingListDelegate(
                                    children: billerList,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
