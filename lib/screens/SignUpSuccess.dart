import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class SignUpSuccess extends StatefulWidget {
  @override
  _SignUpSuccessState createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  String responseStatus = 'Please wait';
  String responseTextTwo = 'Kindly wait as we save your details.';
  String buttonText = 'Please Wait';
  bool checkProgressIndicator = false;

  @override
  void initState() {
    // TODO: implement initState
    checkSignUpResponse();
    super.initState();
  }

  goToHome() {
    if (buttonText == 'Proceed') {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  checkSignUpResponse() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        responseStatus = 'Success!';
        responseTextTwo = 'Your account has been created successfully.';
        buttonText = 'Proceed';
        checkProgressIndicator = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: mainBackgroundColor,
      ),
      child: Scaffold(
        body: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 8,
                    left: SizeConfig.blockSizeHorizontal * 6.5,
                    right: SizeConfig.blockSizeHorizontal * 6.5,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 5,
                              vertical: SizeConfig.blockSizeVertical * 5),
                          child: Text(
                            responseStatus,
                            style: headerTextDark,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 10),
                          child: Container(
                              width: SizeConfig.blockSizeVertical * 20,
                              height: SizeConfig.blockSizeVertical * 20,
                              child: checkProgressIndicator
                                  ? Icon(
                                      Icons.check_circle_outline,
                                      color: Color(0xFFD4D4D4),
                                      size: SizeConfig.blockSizeVertical * 20,
                                      key: UniqueKey(),
                                    )
                                  : CircularProgressIndicator(
                                      strokeWidth: 4.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )),
                        ),
                        Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 5),
                          child: Text(
                            responseTextTwo,
                            style: normalTextDark,
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    goToHome();
                  },
                  child: Container(
                    width: double.maxFinite,
                    color: mainBackgroundColor,
                    alignment: Alignment.center,
                    child: Text(
                      buttonText.toUpperCase(),
                      style: loginButtonDark,
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
