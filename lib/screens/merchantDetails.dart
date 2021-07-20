import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payment_assistant/screens/dashboard.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class merchantdetails extends StatefulWidget {
  var billerDetails;
  merchantdetails(this.billerDetails);
  @override
  _merchantdetailsState createState() => _merchantdetailsState();
}

class _merchantdetailsState extends State<merchantdetails> {
  var containerHeroTag;
  var billerData;
  bool showBottomContainer = false;
  final _paymentFormKey = new GlobalKey<FormState>();
  var paymentFormController = TextEditingController();
  var paymentMethod = "mPesa";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.billerData = widget.billerDetails;
    containerHeroTag = widget.billerDetails["id"];
    print('container$containerHeroTag');
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        showBottomContainer = true;
      });
    });
  }

  navigateToDashboard() {
    showBottomContainer = false;
    Navigator.pop(context);
  }

  //biller details card template
  Widget billerTitleCard() {
    var heroTag = this.billerData["id"];
    var containerHeroTag = 'container' + heroTag;
    var imageUrl = "images/" + this.billerData["image"];
    var billerName = this.billerData["name"];
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails dd) {
        navigateToDashboard();
      },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        width: SizeConfig.blockSizeHorizontal * 60,
        // alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            height: SizeConfig.blockSizeHorizontal * 50,
            width: SizeConfig.blockSizeHorizontal * 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: containerHeroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 1,
                      horizontal: SizeConfig.blockSizeVertical * 1,
                    ),
                    height: SizeConfig.blockSizeHorizontal * 50,
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeHorizontal * 50,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 3),
                  width: 130.0,
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: '$billerName',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        '$billerName',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 11,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeHorizontal * 25.5,
                  padding: EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Transform.scale(
                      scale: 1.3,
                      child: Hero(
                        tag: '$imageUrl',
                        child: Image(
                          image: AssetImage(imageUrl),
                          alignment: Alignment.bottomCenter,
                          width: SizeConfig.blockSizeHorizontal * 21,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentForm() {
    return Form(
      key: _paymentFormKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 19,
          right: SizeConfig.blockSizeHorizontal * 19,
          top: SizeConfig.blockSizeVertical * 3,
          bottom: SizeConfig.blockSizeVertical * 2,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: paymentFormController,
              validator: (val) =>
                  val.length == 0 || val == "" || val.trim().isEmpty
                      ? "Enter amount to pay"
                      : null,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0),
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide:
                        const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  hintText: 'Enter Amount to Pay',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0,
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                  fillColor: Color(0xffD3D3D3),
                  filled: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentChannel() {
    return Container(
        height: SizeConfig.blockSizeVertical * 15,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
              height: SizeConfig.blockSizeVertical * 12,
              viewportFraction: 0.35,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (int index, var carouselPageChangeReason) {
                if (index == 0) {
                  setState(() {
                    paymentMethod = "mPesa";
                  });
                } else if (index == 1) {
                  setState(() {
                    paymentMethod = "Bank Account";
                  });
                } else {
                  setState(() {
                    paymentMethod = "Loan";
                  });
                }
              }),
          items: ['images/mpesa.png', 'images/bank.png', 'images/loan.png']
              .map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: SizeConfig.blockSizeHorizontal * 35,
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 3,
                        horizontal: SizeConfig.blockSizeHorizontal * 5),
                    height: SizeConfig.blockSizeVertical * 10,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.blockSizeVertical * 1.5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset('$i'));
              },
            );
          }).toList(),
        ));
  }

  Widget paymentMethodText() {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      child: Text(
        '$paymentMethod',
        style: normalText,
      ),
    );
  }

  Widget makePaymentButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        height: SizeConfig.blockSizeVertical * 11,
        alignment: Alignment.center,
        child: Text(
          'Proceed'.toUpperCase(),
          style: loginButton,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // height: MediaQuery.of(context).size.height,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: mainBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(),
              Container(
                height: (MediaQuery.of(context).size.height -
                    SizeConfig.blockSizeVertical * 12),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        bottom: showBottomContainer
                            ? 0
                            : -(SizeConfig.blockSizeVertical * 72),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  SizeConfig.blockSizeVertical * 4.5),
                              topRight: Radius.circular(
                                  SizeConfig.blockSizeVertical * 4.5),
                            ),
                            color: Color(0xFFbebebe),
                          ),
                          height: SizeConfig.blockSizeVertical * 72,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 12,
                              ),
                              Container(
                                  child: Text(
                                'Swipe Down',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 14.0),
                              )),
                              Container(
                                  child: Text(
                                widget.billerDetails['name'],
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black.withOpacity(1),
                                    fontSize: 15.0),
                              )),
                              paymentForm(),
                              paymentChannel(),
                              paymentMethodText(),
                              makePaymentButton()
                            ],
                          ),
                        )),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                          SizeConfig.blockSizeVertical * 12),
                      alignment: Alignment.topCenter,
                      child: billerTitleCard(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
