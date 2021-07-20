import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int pageIndex;
  var pageNumberAlignment = Alignment.centerRight;
  final signUpFormKey = new GlobalKey<FormState>();

//  animationController
  bool animationController = false;

// Signup form bits
  final generalDetailsFormKey = new GlobalKey<FormState>();
  final identificationDetailsFormKey = new GlobalKey<FormState>();
  final contactDetailsFormKey = new GlobalKey<FormState>();

  // General details fields
  var firstNameController = TextEditingController();
  var middleNameController = TextEditingController();
  var lastNameController = TextEditingController();

  var idTypeController = TextEditingController();
  var idNumberController = TextEditingController();

  var phoneNumberController = TextEditingController();
  var emailAddressController = TextEditingController();

  bool smsToggle = false;
  bool inAppToggle = false;
  bool emailToggle = false;

  var pagenumberOneStyle;
  var pagenumberTwoStyle;
  var pagenumberThreeStyle;

  bool statementPref = false;

  //Navigate Back to Control Panel
  back() {
    Future.delayed(const Duration(milliseconds: 130), () {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      this.pageIndex = 0;
      this.nextForm(this.pageIndex);
      this.pagenumberOneStyle = signUpPageNumberActive;
      this.pagenumberTwoStyle = signUpPageNumber;
      this.pagenumberThreeStyle = signUpPageNumber;
      this.animationController = true;
    });
  }

  nextForm(int pageIndex) {
    print(pageIndex);

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        this.pageIndex += 1;
      });
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        currentForm(this.pageIndex);
      });
    });

    if ((pageIndex + 1) == 4) {
      Future.delayed(Duration(milliseconds: 50), () {
        Navigator.pushReplacementNamed(context, '/signUpSuccess');
      });
    }

    setState(() {
      this.animationController = false;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        this.animationController = true;
      });
    });
  }

  previousForm(int pageIndex) {
    print(pageIndex);
    if ((pageIndex - 1) == 0) {
      Future.delayed(Duration(milliseconds: 0), () {
        this.back();
      });
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        this.pageIndex -= 1;
      });
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        currentForm(this.pageIndex);
      });
    });

    setState(() {
      this.animationController = false;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        this.animationController = true;
      });
    });
  }

  // Validate and process login form
  validateSignUpForm(BuildContext context, int formIndex) async {
    if (formIndex == 1) {
      if (generalDetailsFormKey.currentState.validate()) {
        nextForm(formIndex);
        // SignUpUser(context, full_name, email_address, phone_number, password);
      }
    } else if (formIndex == 2) {
      if (identificationDetailsFormKey.currentState.validate()) {
        nextForm(formIndex);
        // SignUpUser(context, full_name, email_address, phone_number, password);
      }
    } else if (formIndex == 3) {
      if (contactDetailsFormKey.currentState.validate()) {
        nextForm(formIndex);
        // SignUpUser(context, full_name, email_address, phone_number, password);
      }
    } else {
      nextForm(formIndex);
    }
  }

  // General details form
  generalDetailsContainer() {
    return Container(
        height: SizeConfig.blockSizeVertical * 46,
        width: SizeConfig.blockSizeHorizontal * 67,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: animationController ? 1 : 0,
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: Form(
                key: generalDetailsFormKey,
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: TextFormField(
                        controller: firstNameController,
                        validator: (val) => val.length == 0 || val == ""
                            ? "Enter your First Name"
                            : null,
                        keyboardType: TextInputType.text,
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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                            fillColor: Color(0xffD3D3D3),
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.maxFinite,
                      child: TextFormField(
                        controller: middleNameController,
                        validator: (val) => val.length == 0 || val == ""
                            ? "Enter your Middle Name"
                            : null,
                        keyboardType: TextInputType.text,
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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'Middle Name',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                            fillColor: Color(0xffD3D3D3),
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.maxFinite,
                      child: TextFormField(
                        controller: lastNameController,
                        validator: (val) => val.length == 0 || val == ""
                            ? "Enter your Last Name"
                            : null,
                        keyboardType: TextInputType.text,
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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                            fillColor: Color(0xffD3D3D3),
                            filled: true),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  toggleStatementPref() {
    setState(() {
      statementPref = !statementPref;
    });
  }

  String dropdownValue = 'ID Type';

  identificationDetailsContainer() {
    return Container(
      height: SizeConfig.blockSizeVertical * 46,
      width: SizeConfig.blockSizeHorizontal * 67,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: animationController ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: Form(
              key: identificationDetailsFormKey,
              child: Column(
                children: [
                  // SizedBox(
                  //   height: SizeConfig.blockSizeVertical * 15,
                  // ),
                  DropdownButtonFormField<String>(
                    value: dropdownValue,
                    validator: (val) =>
                        val.length == 0 || val == "" || val == "ID Type"
                            ? "Select ID Type"
                            : null,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
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
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        hintText: 'ID Number',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: 0,
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                        fillColor: Color(0xffD3D3D3),
                        filled: true),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'ID Type',
                      'National ID',
                      'Alien ID',
                      'Passport'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 0,
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.maxFinite,
                    child: TextFormField(
                      controller: idNumberController,
                      validator: (val) => val.length == 0 || val == ""
                          ? "Enter your ID Number"
                          : null,
                      keyboardType: TextInputType.text,
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
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          hintText: 'ID Number',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              letterSpacing: 0,
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700),
                          fillColor: Color(0xffD3D3D3),
                          filled: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  contactDetailsContainer() {
    return Container(
        height: SizeConfig.blockSizeVertical * 46,
        width: SizeConfig.blockSizeHorizontal * 67,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: animationController ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: Form(
                key: contactDetailsFormKey,
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: TextFormField(
                        controller: phoneNumberController,
                        validator: (val) => val.length == 0 || val == ""
                            ? "Enter your Phone Number"
                            : null,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                            fillColor: Color(0xffD3D3D3),
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: TextFormField(
                        controller: emailAddressController,
                        validator: (val) => val.length == 0 || val == ""
                            ? "Enter your Email Address"
                            : null,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0,
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                            fillColor: Color(0xffD3D3D3),
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Statement preference?', style: normalText),
                          InkWell(
                            onTap: toggleStatementPref,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: SizeConfig.blockSizeVertical * 3.0,
                              width: SizeConfig.blockSizeHorizontal * 14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeVertical * 2.9),
                                color: statementPref
                                    ? Color(0xFF191919)
                                    : Color(0xFF191919),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  AnimatedPositioned(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                    top: SizeConfig.blockSizeVertical * 0.15,
                                    left: statementPref
                                        ? SizeConfig.blockSizeHorizontal * 7.5
                                        : 0,
                                    right: statementPref
                                        ? 0
                                        : SizeConfig.blockSizeHorizontal * 7.5,
                                    child: statementPref
                                        ? Icon(
                                            Icons.check_circle_outline,
                                            color: Color(0xFFD4D4D4),
                                            size: SizeConfig.blockSizeVertical *
                                                2.7,
                                            key: UniqueKey(),
                                          )
                                        : Icon(
                                            Icons.remove_circle_outline,
                                            color: Color(0xFFD4D4D4),
                                            size: SizeConfig.blockSizeVertical *
                                                2.7,
                                            key: UniqueKey(),
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 3,
                          vertical: SizeConfig.blockSizeVertical * 1),
                      width: double.maxFinite,
                      child: Text('Notification preference',
                          textAlign: TextAlign.start, style: normalText),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 15,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.black)),
                            color:
                                smsToggle ? Colors.black : Colors.transparent,
                            textColor: smsToggle ? Colors.white : Colors.black,
                            onPressed: () {
                              selectNotificationsToggle('sms');
                            },
                            child: Text(
                              'SMS',
                              style: smsToggle
                                  ? notificationTextDark
                                  : notificationText,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.black)),
                          color:
                              inAppToggle ? Colors.black : Colors.transparent,
                          textColor: Colors.black,
                          onPressed: () {
                            selectNotificationsToggle('in app');
                          },
                          child: Text(
                            'In App Notification',
                            style: inAppToggle
                                ? notificationTextDark
                                : notificationText,
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 17,
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.black)),
                            color:
                                emailToggle ? Colors.black : Colors.transparent,
                            textColor: Colors.black,
                            onPressed: () {
                              selectNotificationsToggle('email');
                            },
                            child: Text(
                              'Email',
                              style: emailToggle
                                  ? notificationTextDark
                                  : notificationText,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  selectNotificationsToggle(String button) {
    if (button == 'sms') {
      setState(() {
        smsToggle = true;
        inAppToggle = false;
        emailToggle = false;
      });
    } else if (button == 'in app') {
      smsToggle = false;
      inAppToggle = true;
      emailToggle = false;
    } else if (button == 'email') {
      smsToggle = false;
      inAppToggle = false;
      emailToggle = true;
    }
  }

  signUpForm() {
    return Form(
        key: signUpFormKey,
        child: Stack(
          children: currentForm(this.pageIndex),
        ));
  }

  currentForm(int pageIndex) {
    switch (pageIndex) {
      case 0:
        {
          setState(() {
            pageNumberAlignment = Alignment.centerRight;
          });
          Future.delayed(const Duration(milliseconds: 150), () {
            setState(() {
              pagenumberOneStyle = signUpPageNumberActive;
              pagenumberTwoStyle = signUpPageNumber;
              pagenumberThreeStyle = signUpPageNumber;
            });
          });
          return generalDetailsContainer();
        }
        break;
      case 1:
        {
          setState(() {
            pageNumberAlignment = Alignment.centerRight;
          });
          Future.delayed(const Duration(milliseconds: 150), () {
            setState(() {
              pagenumberOneStyle = signUpPageNumberActive;
              pagenumberTwoStyle = signUpPageNumber;
              pagenumberThreeStyle = signUpPageNumber;
            });
          });
          return generalDetailsContainer();
        }
        break;

      case 2:
        {
          setState(() {
            pageNumberAlignment = Alignment.center;
          });
          Future.delayed(const Duration(milliseconds: 150), () {
            setState(() {
              pagenumberOneStyle = signUpPageNumber;
              pagenumberTwoStyle = signUpPageNumberActive;
              pagenumberThreeStyle = signUpPageNumber;
            });
          });
          return identificationDetailsContainer();
        }
        break;

      case 3:
        {
          setState(() {
            pageNumberAlignment = Alignment.centerLeft;
          });
          Future.delayed(const Duration(milliseconds: 150), () {
            setState(() {
              pagenumberOneStyle = signUpPageNumber;
              pagenumberTwoStyle = signUpPageNumber;
              pagenumberThreeStyle = signUpPageNumberActive;
            });
          });
          return contactDetailsContainer();
        }
        break;

      default:
        {
          //statements;
          setState(() {
            pageNumberAlignment = Alignment.centerLeft;
          });
          Future.delayed(const Duration(milliseconds: 150), () {
            setState(() {
              pagenumberOneStyle = signUpPageNumber;
              pagenumberTwoStyle = signUpPageNumber;
              pagenumberThreeStyle = signUpPageNumberActive;
            });
          });
          return contactDetailsContainer();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: mainBackgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 4,
                  left: SizeConfig.blockSizeHorizontal * 6.5,
                  right: SizeConfig.blockSizeHorizontal * 6.5,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 5,
                            left: SizeConfig.blockSizeHorizontal * 0),
                        child: InkWell(
                          onTap: () {
                            // Back();
                            previousForm(this.pageIndex);
                          },
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeVertical * 5,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage('images/backArrow.png'),
                              height: SizeConfig.safeBlockVertical * 2.5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3,
                          left: SizeConfig.blockSizeHorizontal * 10,
                          right: SizeConfig.blockSizeHorizontal * 10,
                        ),
                        child: Text(
                          'Sign Up',
                          style: headerText,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 6,
                            left: SizeConfig.blockSizeHorizontal * 18,
                            right: SizeConfig.blockSizeHorizontal * 18),
                        child: AnimatedAlign(
                          alignment: this.pageNumberAlignment,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 20,
                            child: Row(
                              children: [
                                Text(
                                  '1',
                                  style: pagenumberOneStyle,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2,
                                ),
                                Text(
                                  '2',
                                  style: pagenumberTwoStyle,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 2,
                                ),
                                Text(
                                  '3',
                                  style: pagenumberThreeStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: SizeConfig.blockSizeVertical * 46,
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 5,
                          bottom: SizeConfig.blockSizeVertical * 2,
                          left: SizeConfig.blockSizeHorizontal * 10,
                          right: SizeConfig.blockSizeHorizontal * 10,
                        ),
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                                duration: Duration(milliseconds: 150),
                                top: animationController
                                    ? 0
                                    : SizeConfig.blockSizeVertical * 2,
                                curve: Curves.fastOutSlowIn,
                                child: currentForm(this.pageIndex))
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  validateSignUpForm(context, this.pageIndex);
                  // nextForm;
                },
                child: Container(
                  width: double.maxFinite,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    'Next'.toUpperCase(),
                    style: loginButton,
                  ),
                ),
              ),
            ),
          ])),
    ));
  }
}
