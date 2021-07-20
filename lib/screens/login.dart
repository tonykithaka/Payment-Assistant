import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payment_assistant/screens/dashboard.dart';
import 'package:payment_assistant/screens/signup.dart';
import 'package:payment_assistant/style/customStyle.dart';
import 'package:payment_assistant/style/size_config.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginUserFormKey = new GlobalKey<FormState>();
  var loginEmailAddressController = TextEditingController();
  var loginPasswordController = TextEditingController();
  var top = 20.0;

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric;

  //Stores all types of biometrics available
  List<BiometricType> _availableBiometrics;
  //This string will check if we can access the app or not
  String authorized = "Not authorized";

  //This function will check the device for biometrics
  Future<void> _checkBiometric() async {
    bool canCheckBiometric;

    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      this._canCheckBiometric = canCheckBiometric;
    });
  }

  //Get the available biometric sensors
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometric;

    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _availableBiometrics = availableBiometric;
    });
  }

  //Main function that will allow user to authenticate
  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: "Scan your finger to login.",
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      //  Here we can add any function if the user is authenticated or not.
      authorized = authenticated ? "Authorized Access." : "Failed to Authorize";

      if (authenticated) {
        loginRoute();
      } else {
        print(authorized);
      }
    });
  }

  void initState() {
    _checkBiometric();
    _getAvailableBiometrics();
  }

  //Login form
  Widget loginForm() {
    return Form(
        key: loginUserFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: loginEmailAddressController,
                validator: (val) =>
                    val.length == 0 || val == "" || val.trim().isEmpty
                        ? "Enter your email address"
                        : null,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
            Container(
              height: 15,
            ),
            Container(
              child: TextFormField(
                controller: loginPasswordController,
                validator: (val) {
                  if (val.length == 0 || val == "" || val.trim().isEmpty) {
                    return "Enter your password";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
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
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    hintText: 'Password',
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
        ));
  }

  signUpRoute() async {
    // Navigator.push(context, SignUp());

    Navigator.of(context).push(PageRouteBuilder(
      fullscreenDialog: true,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SignUp();
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

  loginRoute() async {
    Navigator.of(context).push(PageRouteBuilder(
      fullscreenDialog: true,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Dashboard();
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

  // Validate and process login form
  validateLoginForm(BuildContext context) async {
    if (loginUserFormKey.currentState.validate()) {
      print("Validation successfull");
      loginUserFormKey.currentState.save();
      var loginEmailAddress = loginEmailAddressController.text;
      var loginPassword = loginPasswordController.text;
      print(loginEmailAddress + " " + loginPassword);
      loginRoute();
      // SignUpUser(context, full_name, email_address, phone_number, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
        body: SingleChildScrollView(
          child: Container(
            color: mainBackgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 4,
                      left: SizeConfig.blockSizeHorizontal * 6.5,
                      right: SizeConfig.blockSizeHorizontal * 6.5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 13,
                              left: SizeConfig.blockSizeHorizontal * 10),
                          child: Text(
                            'Log In',
                            style: headerText,
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 10,
                            right: SizeConfig.blockSizeHorizontal * 10,
                            top: SizeConfig.blockSizeVertical * 10,
                            bottom: SizeConfig.blockSizeVertical * 0,
                          ),
                          child: loginForm(),
                        ),
                        Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 15.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 60.0,
                                    alignment: Alignment.center,
                                    child:
                                        Image.asset('images/fingerprint.png'),
                                  ),
                                  onTap: () {
                                    _authenticate();
                                  },
                                ),
                                Container(
                                  height: 30.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Use Biometrics',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black.withOpacity(0.3),
                                        fontSize: 14.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                SizeConfig.blockSizeVertical *
                                                    3),
                                        child: Text(
                                          'Forgot Password?',
                                          style: normalText,
                                        ),
                                      ))),
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        signUpRoute();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                SizeConfig.blockSizeVertical *
                                                    3),
                                        child: Text(
                                          'Sign Up',
                                          textAlign: TextAlign.end,
                                          style: normalText,
                                        ),
                                      )))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("Login in");
                      validateLoginForm(context);
                    },
                    child: Container(
                      width: double.maxFinite,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Text(
                        'Login'.toUpperCase(),
                        style: loginButton,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
