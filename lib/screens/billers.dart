import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../style/customStyle.dart';
import '../style/size_config.dart';

class Billers extends StatefulWidget {
  @override
  _BillersState createState() => _BillersState();
}

class _BillersState extends State<Billers> with SingleTickerProviderStateMixin {
  List<dynamic> customerBillersFetched = [];
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    customerBillersFetched = CUSTOMER_BILLER_LIST;
    // getBillerList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  //Navigate Back to Control Panel
  back() {
    Future.delayed(const Duration(milliseconds: 130), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: mainBackgroundColor,
      ),
      child: Scaffold(
          backgroundColor: mainBackgroundColor,
          body: SingleChildScrollView(
              child: Container(
            color: mainBackgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 0,
                    left: SizeConfig.blockSizeHorizontal * 0,
                    right: SizeConfig.blockSizeHorizontal * 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backButtonBar(),
                      Container(child: billerPages())
                    ],
                  ),
                )
              ],
            ),
          ))),
    );
  }

  //back to dashboard navigation
  //Design info
  // - Total Height = 10

  static const ColorFilter invert = ColorFilter.matrix(<double>[
    -1,
    0,
    0,
    0,
    255,
    0,
    -1,
    0,
    0,
    255,
    0,
    0,
    -1,
    0,
    255,
    0,
    0,
    0,
    1,
    0,
  ]);

  Widget backButtonBar() {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 8,
          left: SizeConfig.blockSizeHorizontal * 9),
      child: InkWell(
        onTap: () {
          back();
        },
        child: Container(
          width: SizeConfig.blockSizeVertical * 5,
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage('images/backArrow.png'),
            height: SizeConfig.safeBlockVertical * 2.5,
          ),
        ),
      ),
    );
  }

  //Title for biller page

  //Biller pages container
  //Generate Billers and biller payment information
  Widget billerPages() {
    var billerCount = 14;
    return Container(
      height: MediaQuery.of(context).size.height -
          (SizeConfig.blockSizeVertical * 12),
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: mainBackgroundColor,
              floating: true,
              forceElevated: boxIsScrolled,
              automaticallyImplyLeading: false,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 16),
                        child: Text(
                          'My Billers',
                          style: normalBigTextBold,
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          right: SizeConfig.blockSizeHorizontal * 8, top: 0),
                      child: Text(
                        '$billerCount Billers',
                        style: billerCountText,
                      ),
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0),
                    insets: EdgeInsets.symmetric(horizontal: 50.0)),
                labelStyle: normalTextDark,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Billers",
                  ),
                  Tab(
                    text: "Buy Airtime",
                  )
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              child: FutureBuilder(
                future: getBillerList(),
                builder: (context, projectSnap) {
                  var childCount = 0;

                  if (projectSnap.connectionState != ConnectionState.done ||
                      projectSnap.hasData == null)
                    childCount = 1;
                  else
                    childCount = projectSnap.data.length;

                  return ListView.builder(
                      itemCount: projectSnap.data.length,
                      itemBuilder: (context, int index) {
                        if (index.isEven) {
                          return Container(
                            height: SizeConfig.blockSizeVertical * 16,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.blockSizeVertical * 4),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 18,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 9),
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1.5,
                                    bottom: SizeConfig.blockSizeVertical * 1.5,
                                    right: SizeConfig.blockSizeHorizontal * 7,
                                  ),
                                  alignment: Alignment.centerRight,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeHorizontal * 10),
                                    color: Color(0xFF666666),
                                    border: Border(),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: SizeConfig
                                                            .blockSizeVertical *
                                                        0.9),
                                                child: Image.asset(
                                                  'images/white_dots.png',
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      0.7,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 8,
                                        padding: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical * 0,
                                          bottom: SizeConfig.blockSizeVertical *
                                              0.5,
                                          left: SizeConfig.blockSizeHorizontal *
                                              17,
                                        ),
                                        width:
                                            SizeConfig.blockSizeHorizontal * 70,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              customerBillersFetched[index]
                                                  ["name"],
                                              style: normalTextSmallDark,
                                            ),
                                            Text(
                                              "Acc. No: " +
                                                  customerBillersFetched[index]
                                                      ["account"],
                                              style: normalTextSmallLightDark,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Kes. " +
                                                      customerBillersFetched[
                                                          index]["amount"] +
                                                      ' by ' +
                                                      customerBillersFetched[
                                                          index]["due_date"],
                                                  style: normalTextSmallAccount,
                                                ),
                                                Text(
                                                  customerBillersFetched[index]
                                                      ["status"],
                                                  style: customerBillersFetched[
                                                                  index]
                                                              ["status"] ==
                                                          "Due"
                                                      ? normalTextSmallPaymentStatusDue
                                                      : normalTextSmallPaymentStatusPaid,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 2.5,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 70,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Source: ' +
                                              customerBillersFetched[index]
                                                  ["source"],
                                          style: normalTextSmallDark,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 10),
                                  padding: EdgeInsets.all(
                                      SizeConfig.blockSizeHorizontal * 3.5),
                                  height: SizeConfig.blockSizeHorizontal * 20,
                                  width: SizeConfig.blockSizeHorizontal * 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.blockSizeHorizontal * 7),
                                      color: Colors.black,
                                      border: Border(),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.black,
                                          Color(0XFF222222),
                                        ],
                                      )),
                                  // child: Text('$customerBillersFetched'),
                                  child: Image(
                                    image: AssetImage("images/" +
                                        customerBillersFetched[index]["image"]),
                                    alignment: Alignment.center,
                                    width: SizeConfig.blockSizeHorizontal * 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            height: SizeConfig.blockSizeVertical * 16,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.blockSizeVertical * 4),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 18,
                                      right:
                                          SizeConfig.blockSizeHorizontal * 9),
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 1.5,
                                    bottom: SizeConfig.blockSizeVertical * 1.5,
                                    right: SizeConfig.blockSizeHorizontal * 7,
                                  ),
                                  alignment: Alignment.centerRight,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeHorizontal * 10),
                                    color: Colors.white,
                                    border: Border(),
                                  ),
                                  // child: Text(customerBillersFetched[index]["name"]),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: SizeConfig
                                                            .blockSizeVertical *
                                                        0.9),
                                                child: Image.asset(
                                                  'images/black_dots.png',
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      0.7,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 8,
                                        padding: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical *
                                              0.5,
                                          bottom: SizeConfig.blockSizeVertical *
                                              0.5,
                                          left: SizeConfig.blockSizeHorizontal *
                                              17,
                                        ),
                                        width:
                                            SizeConfig.blockSizeHorizontal * 70,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              customerBillersFetched[index]
                                                  ["name"],
                                              style: normalTextSmall,
                                            ),
                                            Text(
                                              "Acc. No: " +
                                                  customerBillersFetched[index]
                                                      ["account"],
                                              style: normalTextSmallLight,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Kes. " +
                                                      customerBillersFetched[
                                                          index]["amount"] +
                                                      ' by ' +
                                                      customerBillersFetched[
                                                          index]["due_date"],
                                                  style: normalTextSmallAccount,
                                                ),
                                                Text(
                                                  customerBillersFetched[index]
                                                      ["status"],
                                                  style: customerBillersFetched[
                                                                  index]
                                                              ["status"] ==
                                                          "Due"
                                                      ? normalTextSmallPaymentStatusDue
                                                      : normalTextSmallPaymentStatusPaid,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 2.5,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 70,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Source: ' +
                                              customerBillersFetched[index]
                                                  ["source"],
                                          style: normalTextSmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.blockSizeHorizontal *
                                            10),
                                    padding: EdgeInsets.all(
                                        SizeConfig.blockSizeHorizontal * 3.5),
                                    height: SizeConfig.blockSizeHorizontal * 20,
                                    width: SizeConfig.blockSizeHorizontal * 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.blockSizeHorizontal * 7),
                                        color: Colors.white,
                                        border: Border(),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 10,
                                            blurRadius: 50,
                                            offset: Offset(30,
                                                30), // changes position of shadow
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            mainBackgroundColor,
                                            Colors.white,
                                          ],
                                        )),
                                    child: ColorFiltered(
                                      colorFilter: invert,
                                      child: Image(
                                        image: AssetImage("images/" +
                                            customerBillersFetched[index]
                                                ["image"]),
                                        alignment: Alignment.center,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 20,
                                      ),
                                    )),
                              ],
                            ),
                          );
                        }
                      });
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              color: Colors.transparent,
            )
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Future getBillerList() async {
    return this.customerBillersFetched;
  }

// Widget billerPages() {
//   var billerCount = 14;
//   return Container(
//     height: MediaQuery.of(context).size.height -
//         (SizeConfig.blockSizeVertical * 12),
//     child: NestedScrollView(
//        [
//         SliverAppBar(
//           pinned: false,
//           backgroundColor: mainBackgroundColor,
//           floating: false,
//           automaticallyImplyLeading: false,
//           expandedHeight: SizeConfig.blockSizeVertical * -10,
//
//           flexibleSpace: Container(
//             margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1.5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                     padding: EdgeInsets.only(
//                         left: SizeConfig.blockSizeHorizontal * 16),
//                     child: Text(
//                       'My Billers',
//                       style: normalBigTextBold,
//                     )),
//                 Container(
//                   padding: EdgeInsets.only(
//                       right: SizeConfig.blockSizeHorizontal * 8, top: 0),
//                   child: Text(
//                     '$billerCount Billers',
//                     style: billerCountText,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 text: "Billers",
//               ),
//               Tab(
//                 text: "Buy Airtime",
//               )
//             ],
//             controller: _tabController,
//           ),
//
//         ),
//         SliverAppBar(
//           shadowColor: Colors.transparent,
//           foregroundColor: mainBackgroundColor,
//           automaticallyImplyLeading: false,
//           pinned: true,
//           backgroundColor: Colors.transparent,
//           floating: true,
//           expandedHeight: SizeConfig.blockSizeVertical * 0,
//           flexibleSpace: Container(
//             color: mainBackgroundColor,
//             padding:
//                 EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
//             child: Column(
//               children: [
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     height: SizeConfig.blockSizeVertical * 7,
//                     enlargeCenterPage: false,
//                     viewportFraction: 0.5,
//                     enableInfiniteScroll: false,
//                   ),
//                   items: [
//                     Text(
//                       'View Billers',
//                       style: normalBillerPageTitlesNormal,
//                     ),
//                     Text(
//                       'Buy Airtime',
//                       style: normalBillerPageTitlesNormal,
//                     ),
//                     Text(
//                       'View Billers',
//                       style: normalBillerPageTitlesNormal,
//                     )
//                   ].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           width: SizeConfig.blockSizeHorizontal * 50,
//                           margin: EdgeInsets.symmetric(horizontal: 5.0),
//                           alignment: Alignment.center,
//                           child: i,
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 Container(
//                   height: 3.0,
//                   width: SizeConfig.blockSizeHorizontal * 10,
//                   color: Colors.black,
//                 )
//               ],
//             ),
//           ),
//         ),
// Container(width: MediaQuery.of(context).size.width, height: 200, color: Colors.green,),

// FutureBuilder(
//   future: getBillerList(),
//   builder: (context, projectSnap) {
//     //                Whether project = projectSnap.data[index]; //todo check your model
//     var childCount = 0;
//         if (projectSnap.connectionState != ConnectionState.done ||
//     projectSnap.hasData == null)
//     childCount = 1;
// else
// childCount = projectSnap.data.length;
//     return SliverList(
//       delegate: SliverChildBuilderDelegate((context, index) {
//         if (projectSnap.connectionState != ConnectionState.done) {
//           //todo handle state
//           return CircularProgressIndicator(); //todo set progress bar
//         }
//         if (projectSnap.hasData == null) {
//           return Container();
//         }
//         if (index.isEven) {
//           return Container(
//             height: SizeConfig.blockSizeVertical * 16,
//             width: double.maxFinite,
//             margin: EdgeInsets.only(
//                 bottom: SizeConfig.blockSizeVertical * 4),
//             child: Stack(
//               alignment: Alignment.centerLeft,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                       left: SizeConfig.blockSizeHorizontal * 18,
//                       right: SizeConfig.blockSizeHorizontal * 9),
//                   padding: EdgeInsets.only(
//                     top: SizeConfig.blockSizeVertical * 1.5,
//                     bottom: SizeConfig.blockSizeVertical * 1.5,
//                     right: SizeConfig.blockSizeHorizontal * 7,
//                   ),
//                   alignment: Alignment.centerRight,
//                   height: double.maxFinite,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                         SizeConfig.blockSizeHorizontal * 10),
//                     color: Color(0xFF666666),
//                     border: Border(),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 alignment: Alignment.centerRight,
//                                 padding: EdgeInsets.symmetric(
//                                     vertical:
//                                         SizeConfig.blockSizeVertical *
//                                             0.9),
//                                 child: Image.asset(
//                                   'images/white_dots.png',
//                                   height:
//                                       SizeConfig.blockSizeVertical *
//                                           0.7,
//                                 )),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: SizeConfig.blockSizeVertical * 8,
//                         padding: EdgeInsets.only(
//                           top: SizeConfig.blockSizeVertical * 0,
//                           bottom: SizeConfig.blockSizeVertical * 0.5,
//                           left: SizeConfig.blockSizeHorizontal * 17,
//                         ),
//                         width: SizeConfig.blockSizeHorizontal * 70,
//                         child: Column(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceAround,
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               customerBillersFetched[index]["name"],
//                               style: normalTextSmallDark,
//                             ),
//                             Text(
//                               "Acc. No: " +
//                                   customerBillersFetched[index]
//                                       ["account"],
//                               style: normalTextSmallLightDark,
//                             ),
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Kes. " +
//                                       customerBillersFetched[index]
//                                           ["amount"] +
//                                       ' by ' +
//                                       customerBillersFetched[index]
//                                           ["due_date"],
//                                   style: normalTextSmallAccount,
//                                 ),
//                                 Text(
//                                   customerBillersFetched[index]
//                                       ["status"],
//                                   style: customerBillersFetched[index]
//                                               ["status"] ==
//                                           "Due"
//                                       ? normalTextSmallPaymentStatusDue
//                                       : normalTextSmallPaymentStatusPaid,
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: SizeConfig.blockSizeVertical * 2.5,
//                         width: SizeConfig.blockSizeHorizontal * 70,
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'Source: ' +
//                               customerBillersFetched[index]["source"],
//                           style: normalTextSmallDark,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       left: SizeConfig.blockSizeHorizontal * 10),
//                   padding: EdgeInsets.all(
//                       SizeConfig.blockSizeHorizontal * 3.5),
//                   height: SizeConfig.blockSizeHorizontal * 20,
//                   width: SizeConfig.blockSizeHorizontal * 20,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                           SizeConfig.blockSizeHorizontal * 7),
//                       color: Colors.black,
//                       border: Border(),
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Colors.black,
//                           Color(0XFF222222),
//                         ],
//                       )),
//                   // child: Text('$customerBillersFetched'),
//                   child: Image(
//                     image: AssetImage("images/" +
//                         customerBillersFetched[index]["image"]),
//                     alignment: Alignment.center,
//                     width: SizeConfig.blockSizeHorizontal * 20,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Container(
//             height: SizeConfig.blockSizeVertical * 16,
//             width: double.maxFinite,
//             margin: EdgeInsets.only(
//                 bottom: SizeConfig.blockSizeVertical * 4),
//             child: Stack(
//               alignment: Alignment.centerLeft,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                       left: SizeConfig.blockSizeHorizontal * 18,
//                       right: SizeConfig.blockSizeHorizontal * 9),
//                   padding: EdgeInsets.only(
//                     top: SizeConfig.blockSizeVertical * 1.5,
//                     bottom: SizeConfig.blockSizeVertical * 1.5,
//                     right: SizeConfig.blockSizeHorizontal * 7,
//                   ),
//                   alignment: Alignment.centerRight,
//                   height: double.maxFinite,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                         SizeConfig.blockSizeHorizontal * 10),
//                     color: Colors.white,
//                     border: Border(),
//                   ),
//                   // child: Text(customerBillersFetched[index]["name"]),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 alignment: Alignment.centerRight,
//                                 padding: EdgeInsets.symmetric(
//                                     vertical:
//                                         SizeConfig.blockSizeVertical *
//                                             0.9),
//                                 child: Image.asset(
//                                   'images/black_dots.png',
//                                   height:
//                                       SizeConfig.blockSizeVertical *
//                                           0.7,
//                                 )),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: SizeConfig.blockSizeVertical * 8,
//                         padding: EdgeInsets.only(
//                           top: SizeConfig.blockSizeVertical * 0.5,
//                           bottom: SizeConfig.blockSizeVertical * 0.5,
//                           left: SizeConfig.blockSizeHorizontal * 17,
//                         ),
//                         width: SizeConfig.blockSizeHorizontal * 70,
//                         child: Column(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceAround,
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               customerBillersFetched[index]["name"],
//                               style: normalTextSmall,
//                             ),
//                             Text(
//                               "Acc. No: " +
//                                   customerBillersFetched[index]
//                                       ["account"],
//                               style: normalTextSmallLight,
//                             ),
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Kes. " +
//                                       customerBillersFetched[index]
//                                           ["amount"] +
//                                       ' by ' +
//                                       customerBillersFetched[index]
//                                           ["due_date"],
//                                   style: normalTextSmallAccount,
//                                 ),
//                                 Text(
//                                   customerBillersFetched[index]
//                                       ["status"],
//                                   style: customerBillersFetched[index]
//                                               ["status"] ==
//                                           "Due"
//                                       ? normalTextSmallPaymentStatusDue
//                                       : normalTextSmallPaymentStatusPaid,
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: SizeConfig.blockSizeVertical * 2.5,
//                         width: SizeConfig.blockSizeHorizontal * 70,
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'Source: ' +
//                               customerBillersFetched[index]["source"],
//                           style: normalTextSmall,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                     margin: EdgeInsets.only(
//                         left: SizeConfig.blockSizeHorizontal * 10),
//                     padding: EdgeInsets.all(
//                         SizeConfig.blockSizeHorizontal * 3.5),
//                     height: SizeConfig.blockSizeHorizontal * 20,
//                     width: SizeConfig.blockSizeHorizontal * 20,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             SizeConfig.blockSizeHorizontal * 7),
//                         color: Colors.white,
//                         border: Border(),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 10,
//                             blurRadius: 50,
//                             offset: Offset(
//                                 30, 30), // changes position of shadow
//                           ),
//                         ],
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             mainBackgroundColor,
//                             Colors.white,
//                           ],
//                         )),
//                     child: ColorFiltered(
//                       colorFilter: invert,
//                       child: Image(
//                         image: AssetImage("images/" +
//                             customerBillersFetched[index]["image"]),
//                         alignment: Alignment.center,
//                         width: SizeConfig.blockSizeHorizontal * 20,
//                       ),
//                     )),
//               ],
//             ),
//           );
//         }
//       }, childCount: childCount),
//     );
//   },
// ),

//     ],
//   ),
// );
}
