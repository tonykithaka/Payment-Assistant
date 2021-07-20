import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class Statements extends StatefulWidget {
  @override
  _StatementsState createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        color: mainBackgroundColor,
        child: Column(
          children: [
            TitleTag('Statements'),
            Container(
              child: Text(
                  '${new DateFormat.yMMMMd().format(new DateTime.now())}',
                  textAlign: TextAlign.center,
                  style: normalBigDateNormal),
            ),
            Ministatements(),
            FullStatement(),
          ],
        ),
      ),
    ));
  }
}

class TitleTag extends StatefulWidget {
  final String title;

  TitleTag(this.title);
  @override
  _TitleTagState createState() => _TitleTagState();
}

class _TitleTagState extends State<TitleTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 16,
        vertical: SizeConfig.blockSizeVertical * 4,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.title,
          style: normalBigTextBold,
        ),
      ),
    );
  }
}

class Ministatements extends StatefulWidget {
  @override
  _MinistatementsState createState() => _MinistatementsState();
}

class _MinistatementsState extends State<Ministatements> {
  bool checkAndroidPlatform = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      checkPlatform();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
        top: SizeConfig.blockSizeVertical * 4,
        bottom: checkAndroidPlatform
            ? SizeConfig.blockSizeVertical * 1.2
            : SizeConfig.blockSizeVertical * 2,
      ),
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 3,
        right: SizeConfig.safeBlockHorizontal * 3,
        top: SizeConfig.blockSizeVertical * 0,
        bottom: SizeConfig.blockSizeVertical * 4,
      ),
      height: checkAndroidPlatform
          ? SizeConfig.blockSizeVertical * 47.5
          : SizeConfig.blockSizeVertical * 43,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.blockSizeVertical * 4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 3,
              bottom: SizeConfig.blockSizeVertical * 3,
              left: SizeConfig.blockSizeHorizontal * 6,
              right: SizeConfig.blockSizeHorizontal * 6,
            ),
            child: Text(
              'Ministatement',
              style: normalText,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FullStatement extends StatefulWidget {
  @override
  _FullStatementState createState() => _FullStatementState();
}

class _FullStatementState extends State<FullStatement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
        top: SizeConfig.blockSizeVertical * 4,
        bottom: SizeConfig.blockSizeVertical * 0,
      ),
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 3,
        right: SizeConfig.safeBlockHorizontal * 2,
        top: SizeConfig.blockSizeVertical * 0,
        bottom: SizeConfig.blockSizeVertical * 4,
      ),
      height: SizeConfig.blockSizeVertical * 43,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.blockSizeVertical * 4))),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 3,
                bottom: SizeConfig.blockSizeVertical * 3,
                left: SizeConfig.blockSizeHorizontal * 6,
                right: SizeConfig.blockSizeHorizontal * 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full Statement',
                  style: normalText,
                ),
                InkWell(
                  onTap: () {
                    print('Filter tapped');
                  },
                  child: SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 8,
                    child: Image.asset(
                      'images/filter.png',
                      width: SizeConfig.blockSizeHorizontal * 7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21',
                              style: normalTextSmall,
                            ),
                            Text(
                              'Dec',
                              style: normalTextSmall,
                            ),
                            Text(
                              '2020',
                              style: normalTextSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: SizeConfig.blockSizeVertical * 4.5,
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                        // margin: EdgeInsets.only(
                        //     right: SizeConfig.blockSizeHorizontal * 5),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              'Kes. 3000 sent to KPLC account',
                              style: normalTextSmallLight,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          Container(
                            child: Text(
                              '12:42 pm',
                              style: normalTextSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
