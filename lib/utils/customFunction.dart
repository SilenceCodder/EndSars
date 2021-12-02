import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppTextStyle.dart';
import 'package:endsars/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFunction{
  
  errorUimessage({String errorMessage, int type, BuildContext context}){
   return  (errorMessage == null ? SizedBox.shrink() : Center(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         (type == 1 ? Icon(Icons.check_circle, color: Colors.green,): Icon(Icons.error, color: Colors.red,)),
         SizedBox(width: 10,),
         Expanded(child: Text(errorMessage,
        textAlign: TextAlign.justify,
     overflow: TextOverflow.ellipsis,
             maxLines: 5,
           style: AppTextStyle.header1(context: context, color: (type == 1 ? Colors.green : AppColor.secondary),
           fontWeight: FontWeight.normal,
           )
           ),)
         

       ],),
   ));
  }

   saveEmailandID({String email, String name})async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString( Constants.email, email.toString());
       await prefs.setString( Constants.displayedName, name);
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
}

loadingWidget(){
    return Center(
      child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary,),
                    backgroundColor: AppColor.white,
                    ),
    );
  }

launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}