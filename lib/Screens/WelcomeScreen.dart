import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:stacked/stacked.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:endsars/styles/AppTextStyle.dart';
import 'package:endsars/utils/customFunction.dart';
import 'package:endsars/viewmodel/WelcomeViewModel.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with SingleTickerProviderStateMixin {
   Color baseColor = Color(0xFFE5E5E5); //0xFFE5E5E5
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  AnimationController _animationController;
   final CustomFunction _developerFunction = locator<CustomFunction>();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });
    _animationController.forward();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context, allowFontScaling: false);
    double stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
        stagger(firstDepth, _animationController.value, 0.25);
    double calculatedSecondDepth =
        stagger(secondDepth, _animationController.value, 0.5);
    double calculatedThirdDepth =
        stagger(thirdDepth, _animationController.value, 0.75);
    double calculatedFourthDepth =
        stagger(fourthDepth, _animationController.value, 1);

return ViewModelBuilder<WelcomeViewModel>.reactive(
        viewModelBuilder: () => WelcomeViewModel(),
        builder: (context, model, child) => 
        Scaffold(
      backgroundColor: AppColor.backgroundColor,//baseColor,
      body: SingleChildScrollView(
        child:Column(children: [
        SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
     ClayContainer(
              color: baseColor,
               parentColor: AppColor.board2_1,
              height: 200,
              width: 200,
              borderRadius: 200,
              curveType: CurveType.concave,
               depth: calculatedFirstDepth.toInt(),
            child: Center(
            child: ClayContainer(
                        height: 140,
                        width: 140,
                        borderRadius: 200,
                        color: baseColor,
                        depth: calculatedFourthDepth.toInt(),
                        curveType: CurveType.convex,
                         child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
              AppImage.appLogo,
            ),
                  ),
                ),
                      )
                      ),),
    
     SizedBox(height: 30),
     Image.asset(AppImage.appLogofull, 
     fit: BoxFit.contain,
     ),
    // Text('Welcome to', style: AppTextStyle.header1(
    //   color: AppColor.black,context: context,
    //   fontWeight: FontWeight.bold,
    //   size: AppFontSizes.larger
    // )),
    // FlutterShine(
            
    // builder: (BuildContext context, ShineShadow shineShadow) {
    //     return Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         mainAxisSize: MainAxisSize.max,
    //         children: <Widget>[
    //             Text(
    //                 "Value for Money",
    //                 style: TextStyle(
    //                     fontSize: 30,
    //                     color:AppColor.secondary,
    //                     shadows: shineShadow?.shadows),
    //             ),
    //         ],
    //     );
    // }),


      SizedBox(height: 20),
    // NeumorphicText(
    //     "I love flutter",
    //     style: NeumorphicStyle(
    //       depth: 4,  //customize depth here
    //       color: Colors.white, //customize color here
    //     ),
    //     textStyle: NeumorphicTextStyle(
    //       fontSize: 18, //customize size here
    //       // AND others usual text style properties (fontFamily, fontWeight, ...)
    //     ),
    // ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text('By Tapping sign in,You have agree with our terms and conditions', textAlign: TextAlign.center,
        style: AppTextStyle.header1(
          color: Color(0xFFBABABC),
          context: context,
          fontWeight: FontWeight.bold,
          size: AppFontSizes.small
        )),
      ),
    ),
    SizedBox(height: 20),
    _developerFunction.errorUimessage(
      context: context,
      errorMessage: model.displayMessage,
      type: model.displayMessageType
    ),
SizedBox(height: 30),
(model.isBusy ? _developerFunction.loadingWidget() : SignInButton(
  Buttons.GoogleDark,
  padding: const EdgeInsets.all(10.0),
  elevation: 20.0,
  onPressed: () {
    model.withGoogle();
  },
)),

SizedBox(height: 30),

SignInButton(
  Buttons.Email,
  elevation: 20.0,
   padding: const EdgeInsets.all(10.0),
  onPressed: () {
   model.withEmail();
  },
),

SizedBox(height: 30),

SignInButton(
  Buttons.AppleDark,
  elevation: 5.0,
   padding: const EdgeInsets.all(10.0),
  onPressed: () {
   model.withApple();
  },
),
        ],)
      ),
      
    )

);
  }
  }