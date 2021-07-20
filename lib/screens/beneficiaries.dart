import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_assistant/constants/constants.dart';
import 'package:payment_assistant/screens/statements.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class Beneficiaries extends StatefulWidget {
  @override
  _BeneficiariesState createState() => _BeneficiariesState();
}

class _BeneficiariesState extends State<Beneficiaries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        color: mainBackgroundColor,
        child: Column(
          children: [TitleTag('Beneficiaries'), RemitForm()],
        ),
      ),
    ));
  }
}

class RemitForm extends StatefulWidget {
  @override
  _RemitFormState createState() => _RemitFormState();
}

class _RemitFormState extends State<RemitForm> {
  final remitFormKey = new GlobalKey<FormState>();
  var remitAmountController = TextEditingController();
  List<Widget> beneficiaries = [];
  List<dynamic> beneficiaryList = [];
  bool showContainer;

  @override
  void initState() {
    super.initState();
    beneficiaryList = BENEFICIARY_LIST;
    getBeneficiaryList();
    showContainer = false;
  }

  void getBeneficiaryList() {
    List<Widget> itemsList = [];

    //  Create widget list for revolver cards
    beneficiaryList.forEach((beneficiary) {
      var imageUrl = "images/" + beneficiary["image"];
      var beneficiaryName = beneficiary["name"];
      itemsList.add(GestureDetector(
        onTap: () {
          print('Tapped :: ' + beneficiaryName);
          // showSendToDialog(context);
          showAlertDialog(context, beneficiary);
          // beneficiaryRoute(beneficiary);
        },
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 28,
          padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
          decoration: BoxDecoration(
              color: Color(0xFFEFEFEF),
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.blockSizeVertical * 4))),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeVertical * 3)),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 15,
                  height: SizeConfig.blockSizeVertical * 6.5,
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.blockSizeVertical * 3))),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2.2),
                child: Text(
                  '$beneficiaryName',
                  style: normalText,
                ),
              )
            ],
          ),
        ),
      ));
    });
    setState(() {
      beneficiaries = itemsList;
    });
  }


  // Show payment dialog
  showAlertDialog(BuildContext context, var beneficiary) {
    var containerVerticalPosition = SizeConfig.blockSizeVertical * 22.5;
    var containerHorizontalPosition = (MediaQuery.of(context).size.width / 2) -
        SizeConfig.blockSizeHorizontal * 32.5;

    remitFormKey.currentState.save();
    var loginEmailAddress = remitAmountController.text;
    print(loginEmailAddress);

    if (remitFormKey.currentState.validate()) {
      print("Validation successfull");
      remitFormKey.currentState.save();
      var loginEmailAddress = remitAmountController.text;

      Future.delayed(const Duration(milliseconds: 00), () {
        setState(() {
          showContainer = true;
          print(showContainer);
        });
      });

      // set up the button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {},
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Text("This is my message."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white.withOpacity(0)),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  bottom: showContainer ? containerVerticalPosition : 0,
                  left: containerHorizontalPosition,
                  duration: Duration(milliseconds: 300),
                  child: Center(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2),
                    height: SizeConfig.blockSizeVertical * 45,
                    width: SizeConfig.blockSizeHorizontal * 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(
                            SizeConfig.blockSizeVertical * 2.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 2),
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'You are about to send:',
                              style: normalText,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            remitAmountController.text
                                .toString()
                                .replaceAllMapped(
                                    new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]},'),
                            style: normalBigAmountNormal,
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            'to',
                            style: normalText,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 1,
                        ),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 28,
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeVertical * 1.5),
                          decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.blockSizeVertical * 4))),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.blockSizeVertical * 3)),
                                child: Container(
                                  width: SizeConfig.blockSizeHorizontal * 15,
                                  height: SizeConfig.blockSizeVertical * 6.5,
                                  decoration: BoxDecoration(
                                      // color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeConfig.blockSizeVertical *
                                                  3))),
                                  child: Image.asset(
                                    'images/' + beneficiary["image"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical * 2.2),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      beneficiary["name"],
                                      style: normalText,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeVertical * 2,
                              right: SizeConfig.blockSizeVertical * 2,
                              top: SizeConfig.blockSizeVertical * 4,
                              bottom: SizeConfig.blockSizeVertical * 0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        horizontal:
                                            SizeConfig.blockSizeVertical * 1),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                SizeConfig.blockSizeVertical *
                                                    1))),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        'Cancel',
                                        style: normalTextSmall,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeVertical * 1,
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical *
                                                  1.5,
                                          horizontal:
                                              SizeConfig.blockSizeVertical * 1),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockSizeVertical *
                                                      1))),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          'Send',
                                          style: normalTextSmallDark,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              ],
            );
          });
      // SignUpUser(context, full_name, email_address, phone_number, password);
    }
  }

  Widget remitForm() {
    return Form(
        key: remitFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeVertical * 2)),
                  color: Color(0xffD3D3D3)),
              child: TextFormField(
                controller: remitAmountController,
                validator: (val) =>
                    val.length == 0 || val == "" ? "Amount to Send" : null,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0),
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 3,
                        horizontal: SizeConfig.blockSizeHorizontal * 8),
                    hintText: 'Enter amount to send',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 0,
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                    fillColor: Colors.transparent,
                    filled: true),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 5,
                  horizontal: SizeConfig.blockSizeHorizontal * 4),
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 20),
              child: Text(
                'Recently sent to',
                style: normalText,
              ),
            ),
            Container(
                height: SizeConfig.blockSizeVertical * 15,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 2,
                ),
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 16),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemCount: beneficiaries.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                    itemBuilder: (BuildContext context, int index) =>
                        beneficiaries[index])),
            Container(
                height: SizeConfig.blockSizeVertical * 16,
                width: SizeConfig.blockSizeVertical * 16,
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 3,
                  horizontal: SizeConfig.blockSizeHorizontal * 0,
                ),
                child: InkWell(
                  onTap: () {
                    print('tapping');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical * 7,
                        width: SizeConfig.blockSizeVertical * 7,
                        margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 1,
                            horizontal: SizeConfig.blockSizeVertical * 3),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.blockSizeVertical * 2)),
                            border: Border.all(color: Colors.black)),
                        child: Icon(Icons.add,
                            size: SizeConfig.blockSizeVertical * 3.0,
                            color: Colors.black),
                      ),
                      Text('Add', style: normalText,)
                    ],
                  ),
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical * 5,
            horizontal: SizeConfig.blockSizeHorizontal * 0),
        child: remitForm());
  }
}
