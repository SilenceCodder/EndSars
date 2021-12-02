import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:endsars/styles/AppTextStyle.dart';
import 'package:endsars/utils/customFunction.dart';
import 'package:endsars/viewmodel/SignwithEmailScreenViewModel.dart';
import 'package:endsars/widget/ui_helpers.dart';

class SignwithEmailScreen extends StatefulWidget {
  @override
  _SignwithEmailScreenState createState() => _SignwithEmailScreenState();
}

class _SignwithEmailScreenState extends State<SignwithEmailScreen> {
  
    final CustomFunction _customFuntion = locator<CustomFunction>();
   TextEditingController emailcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<SignwithEmailScreenViewModel>.reactive(
        viewModelBuilder: () => SignwithEmailScreenViewModel(),
      builder: (context, model, child) =>
     Scaffold(
       backgroundColor: AppColor.whiteGrey,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset(AppImage.emailHeader,),
           ),
Center(child: Container(
                    child: Text(
                      "Enter your email",
                      style:AppTextStyle.header1(
        color: AppColor.otherBLue, context: context,
        fontWeight:FontWeight.bold,
        size: AppFontSizes.large2
    )
                    ),
                  ),
                ),
                 verticalSpaceTiny,
                Center(
                  child: SizedBox(
                    child: Text(
                      "We will send you a sign-in link",
                      style:  AppTextStyle.header1(
        color: Color(0xff8F8F8F), context: context,
        fontWeight: FontWeight.w600,
        size: AppFontSizes.medium
    )
                    ),
                  ),
                ),
                 SizedBox(height: 15,),
                 _customFuntion.errorUimessage(errorMessage: model.errorM,
                 type: 0),
               // Center(child:Text(),),
                 verticalSpaceLarge,
                 Container(
                   margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(120)),
                   child: Stack(
                        children: <Widget>[
                          TextField(
                            style: TextStyle(color: Color(0xFF4D70A6)),
                           controller: emailcontroller,
                           textInputAction: TextInputAction.done,
                            keyboardType:TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          color: Color(0xFF4D70A6).withOpacity(0.2),
                                          blurRadius: 16),
                                      BoxShadow(
                                          offset: Offset(-10, -10),
                                          color: Color.fromARGB(170, 255, 255, 255),
                                          blurRadius: 10),
                                    ]),
                                child: Icon(
                                    Icons.email,
                                    color: Color(0xFF4D70A6),
                                  ),
                            ),
                              ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF4D70A6), width: 2),


                                ),
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                    color: Color(0xFF4D70A6), fontSize: 14)
                                    ),
                          ),
                          
                        ],
                      ),
                 ),

          //  Padding(
          //    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          //    child: TextFormField(
          //       //textAlignVertical: TextAlignVertical.center,
          //             controller: emailcontroller,
          //             textInputAction: TextInputAction.done,
          //             keyboardType:TextInputType.emailAddress,
          //             decoration:  InputDecoration(
          //               hintText: 'Email',
          //                contentPadding: EdgeInsets.all(10.0),
          //               enabledBorder: new OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(8.0),
          //               borderSide: new BorderSide(color: AppColor.primary,
          //               ),
          //                         ),
          //               border: new OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(8.0),
          //                   borderSide: new BorderSide(color: AppColor.black
          //                   ),
          //             ),
          //               suffixIcon: (model.errorType == 0 ? SizedBox.shrink() : Icon(Icons.warning, color: Colors.red,))
          //             ),
          //             onChanged: (value){
          //             },
          //           ),
          //  ),

                   verticalSpaceMedium, //Enable space btw
             
GestureDetector(
                      onTap: () {
                            //*** SEND INPUT DATA TO VIEWMODEL*/
                        model.signIn(emailcontroller.text);
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
                              Icon(Icons.email, size: 30, color: AppColor.otherBLue,),
                          horizontalSpaceTiny,
                              Text(
                            "Login with Google",
                            style: AppTextStyle.header1(
        color: AppColor.otherBLue, context: context,
        fontWeight: FontWeight.bold,
        size: AppFontSizes.medium
    )
                          ),
                            ],
                          )
                        ),
                      ),
                    ),
                   verticalSpaceMedium,

        ],),
      )
    )
      );
  }
}