import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import'dart:io' show Platform;
import 'package:endsars/locator.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:endsars/styles/AppText.dart';
import 'package:endsars/styles/AppTextStyle.dart';
import 'package:endsars/utils/customFunction.dart';
import 'package:endsars/widget/ui_helpers.dart';

class CheckInboxScreen extends StatefulWidget {
  final String email;
  CheckInboxScreen({this.email});

  @override
  _CheckInboxScreenState createState() => _CheckInboxScreenState();
}

class _CheckInboxScreenState extends State<CheckInboxScreen> {
  
    final CustomFunction _customFuntion = locator<CustomFunction>();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteGrey,
      body: Column(
        children: <Widget>[
          SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset(AppImage.checkEmail,),
           ),
          Center(
                  child: Container(
                    child: Text(
                      "Check your email!",
                      style: AppTextStyle.header1(
        color:AppColor.secondaryDark, context: context,
        fontWeight:FontWeight.bold,
        size: 24.0
    )
                    ),
                  ),
                ),
                 verticalSpaceTiny,
                
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                          "${AppText.emailText} ${widget.email} \n ${AppText.emailText2}",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.header1(
        color:Color(0xff8F8F8F), context: context,
        fontWeight:FontWeight.w600,
        size:  14.0,
    )
                          
                        ),
                      ),
                    ],
                  ),
                ),
                 verticalSpaceTiny,

                    verticalSpaceMedium, //Enable space btw
                    GestureDetector(
                      onTap: () {
                            
                        openMail();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 80.0, left: 80.0 ),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: ScreenUtil().setHeight(120),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: AppColor.whiteGrey,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: Color(0xFF4D70A6).withOpacity(0.2),
                                    blurRadius: 16),
                                BoxShadow(
                                    offset: Offset(-10, -10),
                                    color: Color.fromARGB(170, 255, 255, 255),
                                    blurRadius: 10),
                              ]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.email, size: 30, color: AppColor.secondaryDark,),
                          horizontalSpaceTiny,
                              Text(
                            "Go to Inbox",
                            style: AppTextStyle.header1(
        color: AppColor.secondary, context: context,
        fontWeight: FontWeight.bold,
        size: AppFontSizes.medium
    )
                          ),
                            ],
                          )
                        ),
                      ),
                    ),
                 
                 
        ],
      )
    );
  }

  openMail(){
    if (Platform.isAndroid) {
  AndroidIntent intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    category: 'android.intent.category.APP_EMAIL',
  );
  intent.launch().catchError((e) {
    
  });
} else if (Platform.isIOS) {
 launch("message://").catchError((e){
    
  });
}
  }
}