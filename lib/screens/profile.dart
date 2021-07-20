import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_assistant/screens/statements.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool bottomWidget = false;

  String loanAmount = 7580.toString().replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  String creditLimit = 15000.toString().replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  var paymentMethod = "mPesa";

  raiseDrawer() {
    Future.delayed(const Duration(milliseconds: 00), () {
      setState(() {
        this.bottomWidget = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    raiseDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height) -
                (SizeConfig.blockSizeVertical * 21),
            alignment: Alignment.topCenter,
            color: mainBackgroundColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    TitleTag('Account Profile'),
                    Transform.translate(
                      offset: const Offset(0.0, -20.0),
                      child: Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 22),
                        child: Text(
                            'Last Used : ${new DateFormat.yMMMMd().format(new DateTime.now())}',
                            textAlign: TextAlign.start,
                            style: normalTextSmallLight),
                      ),
                    ),
                    BalanceWidget(),
                  ],
                ),
                AnimatedPositioned(
                  bottom: bottomWidget
                      ? -(SizeConfig.blockSizeVertical * 0)
                      : -(SizeConfig.blockSizeVertical * 30),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 1.9,
                      // left: SizeConfig.blockSizeHorizontal * 6.5,
                      // right: SizeConfig.blockSizeHorizontal * 6.5,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(SizeConfig.blockSizeVertical * 5),
                          topRight:
                              Radius.circular(SizeConfig.blockSizeVertical * 5),
                        )),
                    height: SizeConfig.blockSizeVertical * 55,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                            height: SizeConfig.blockSizeVertical * 18,
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 10,
                                right: SizeConfig.blockSizeHorizontal * 10,
                                top: SizeConfig.blockSizeVertical * 3,
                                bottom: SizeConfig.blockSizeVertical * 3),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Loan', style: normalBigTextBoldDark),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.25),
                                          child: Text(
                                            'Bal.   ',
                                            style: normalTextDark,
                                          ),
                                        ),
                                        Text('$loanAmount/=',
                                            style: normalBigDateNormalDark),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical * 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Credit Limit is $creditLimit/=',
                                        style: normalTextSmallLightDark),
                                    InkWell(
                                      onTap: () {
                                        print('Requesting');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height:
                                            SizeConfig.blockSizeVertical * 5,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 18,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(SizeConfig
                                                        .blockSizeVertical *
                                                    1)),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Text(
                                          'Request',
                                          style: normalTextSmall,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                        Stack(
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 35,
                              width: double.maxFinite,
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 7),
                              decoration: BoxDecoration(
                                  color: mainBackgroundColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        SizeConfig.blockSizeVertical * 5),
                                    topRight: Radius.circular(
                                        SizeConfig.blockSizeVertical * 5),
                                  )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 4,
                                    bottom: SizeConfig.blockSizeVertical * 2,
                                    left: SizeConfig.blockSizeHorizontal * 15,
                                    right: SizeConfig.blockSizeHorizontal * 15,
                                  ),
                                  child: Text(
                                    'Registered Top Up Options',
                                    style: normalTextSmallLight,
                                  ),
                                ),
                                Container(
                                  height: SizeConfig.blockSizeVertical * 15,
                                  child: Stack(
                                    children: [
                                      new Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    15,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: CarouselSlider(
                                              options: CarouselOptions(
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      12,
                                                  viewportFraction: 0.35,
                                                  enlargeCenterPage: true,
                                                  enableInfiniteScroll: false,
                                                  onPageChanged: (int index,
                                                      var carouselPageChangeReason) {
                                                    if (index == 0) {
                                                      setState(() {
                                                        paymentMethod = "mPesa";
                                                      });
                                                    } else if (index == 1) {
                                                      setState(() {
                                                        paymentMethod =
                                                            "Bank Account";
                                                      });
                                                    } else {
                                                      setState(() {
                                                        paymentMethod = "Loan";
                                                      });
                                                    }
                                                  }),
                                              items: [
                                                'images/mpesa.png',
                                                'images/bank.png',
                                                'images/loan.png'
                                              ].map((i) {
                                                return Builder(
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                        width: SizeConfig
                                                                .blockSizeHorizontal *
                                                            35,
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: SizeConfig
                                                                    .blockSizeVertical *
                                                                3,
                                                            horizontal: SizeConfig
                                                                    .blockSizeHorizontal *
                                                                5),
                                                        height: SizeConfig
                                                                .blockSizeVertical *
                                                            10,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical: 5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      SizeConfig
                                                                              .blockSizeVertical *
                                                                          1.5)),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 5,
                                                              blurRadius: 8,
                                                              offset: Offset(0,
                                                                  7), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child:
                                                            Image.asset('$i'));
                                                  },
                                                );
                                              }).toList(),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: SizeConfig.blockSizeVertical * 8,
                                  width: double.maxFinite,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 0,
                                      left: SizeConfig.blockSizeHorizontal * 15,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: double.maxFinite,
                                          child: Text(
                                            '$paymentMethod',
                                            style: normalText,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: double.maxFinite,
                                          child: InkWell(
                                            onTap: () {
                                              print('Topping up');
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      5,
                                              width: SizeConfig
                                                      .blockSizeHorizontal *
                                                  18,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(SizeConfig
                                                              .blockSizeVertical *
                                                          1)),
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Text(
                                                'Top Up',
                                                style: normalTextSmallDark,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class BalanceWidget extends StatefulWidget {
  @override
  _BalanceWidgetState createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  String accountBalance = '398980'.toString().replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 15,
          vertical: SizeConfig.blockSizeVertical * 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 0.6),
                child: Text(
                  'Bal.   ',
                  style: normalText,
                ),
              ),
              Container(
                child: Text(
                  '$accountBalance /=',
                  style: normalBigAmountNormal,
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              print('Topping up');
            },
            child: Container(
              alignment: Alignment.center,
              height: SizeConfig.blockSizeVertical * 5,
              width: SizeConfig.blockSizeHorizontal * 18,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeVertical * 1)),
                  border: Border.all(color: Colors.black)),
              child: Text(
                'Top Up',
                style: normalTextSmallDark,
              ),
            ),
          )
        ],
      ),
    );
  }
}
