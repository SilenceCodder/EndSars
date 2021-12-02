import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/viewmodel/AddReportScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppText.dart';
import 'package:endsars/styles/AppTextStyle.dart';
import 'package:endsars/utils/customFunction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import 'package:stacked/stacked.dart';

class AddReportScreen extends StatefulWidget {
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {

  final CustomFunction _developerFunction = locator<CustomFunction>();
   TextEditingController emailController, messageController, titleController;
   String stateType, cityType;
  String id;

@override
  void initState() {
    super.initState();
     //SystemChrome.setEnabledSystemUIOverlays ([]); //Enable Full Screen
      emailController = TextEditingController(); //for Username input
      messageController = TextEditingController();
      titleController = TextEditingController();
    id  = randomString(2);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    return ViewModelBuilder<AddReportScreenViewModel>.reactive(
      viewModelBuilder: () => AddReportScreenViewModel(),
       builder: (context, model, child) =>
    Scaffold(
       backgroundColor: AppColor.baseColor,
      appBar: AppBar(
        title: Text('Add Report', style: GoogleFonts.sura(
                        fontSize: AppFontSizes.large,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColor.white
                        ))
                    ),
        backgroundColor: AppColor.primaryDark,
        centerTitle: true,
        leading: GestureDetector(child: Icon(Icons.arrow_back,
         color: AppColor.white, size: 30,),
        onTap: (){
          Navigator.pop(context);
        },)
      ),
       body: SingleChildScrollView(
                child: Padding(
           padding: const EdgeInsets.only(right: 16.0, left: 16.0),
           child: Column(
             children: <Widget>[
               Padding(
                             padding: const EdgeInsets.only(top: 5.0, right: 10, left: 10.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                               Row(
                               children: <Widget>[
                                  Expanded(
                              child: Text('Let Hear from your experience on Police burality',
                                     style: GoogleFonts.sura(
                        fontSize: AppFontSizes.medium,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColor.black
                        )
                    )),
                                  ),
                             ],),
                              SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),

                             ],)
                           ),
                            Padding(
                 padding: const EdgeInsets.only(right: 10, left: 10.0),
                 child: TextField(
                                    cursorRadius: Radius.elliptical(30, 30),
                                   style: AppTextStyle.inputText(context),
                                   controller: titleController,
                                          decoration:  InputDecoration(
                                            hintText: 'Title',
                                        enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: new BorderSide(color: AppColor.primary,
                                        ),
                                    ),
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: new BorderSide(color: AppColor.primary
                                  ),

                            ),
                              hintStyle: AppTextStyle.subHeader2(context, Colors.grey),
                              prefixIcon: Icon(Icons.hearing, color: Colors.grey, size: 16.0,),
                               labelText: 'Title'
                              
                            ),
                                ),
               ),
                            SizedBox(
                        height: ScreenUtil().setHeight(60),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10.0),
                        child: Container(
                           height: 40,
                           width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          //color: AppColor.borderColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft:  const  Radius.circular(0.0),
            topRight: const  Radius.circular(30.0),
            bottomLeft:const  Radius.circular(0.0),
            bottomRight: const  Radius.circular(30.0),
                    ),
                                      color: AppColor.white,
                                      border: Border.all(
                                          style: BorderStyle.solid, 
                                          width: 0.80, color: AppColor.primaryDark),
                                    ),
                          child:  DropdownButton<String>(
                           isExpanded: true,
                           underline: SizedBox(),
                          hint: Text('State', 
                           style: AppTextStyle.subHeader2(context, Colors.grey),),
                           value: stateType,
        items: <String>['Bugs', 'Improvement', 'Ideas', 'Testimony', 'Others'].map((String value) {
          return  DropdownMenuItem<String>(
            value: value,
            child: Text(value.toString(), style: AppTextStyle.inputText(context),),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            stateType = value;
            });
        },
      ),
                        ),
                      ),
               
                    SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),

                       Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10.0),
                        child: Container(
                           height: 40,
                           width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          //color: AppColor.borderColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft:  const  Radius.circular(0.0),
            topRight: const  Radius.circular(30.0),
            bottomLeft:const  Radius.circular(0.0),
            bottomRight: const  Radius.circular(30.0),
                    ),
                                      color: AppColor.white,
                                      border: Border.all(
                                          style: BorderStyle.solid, 
                                          width: 0.80, color: AppColor.primaryDark),
                                    ),
                          child:  DropdownButton<String>(
                           isExpanded: true,
                           underline: SizedBox(),
                          hint: Text('City(Optional)', 
                           style: AppTextStyle.subHeader2(context, Colors.grey),),
                           value: cityType,
        items: <String>['Bugs', 'Improvement', 'Ideas', 'Testimony', 'Others'].map((String value) {
          return  DropdownMenuItem<String>(
            value: value,
            child: Text(value.toString(), style: AppTextStyle.inputText(context),),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            cityType = value;
            });
        },
      ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                      ),

                        Padding(
                 padding: const EdgeInsets.only(right: 10, left: 10.0),
                 child: TextField(
                                    cursorRadius: Radius.elliptical(30, 30),
                                   style: AppTextStyle.inputText(context),
                                   controller: messageController,
                                   maxLines: 5,
                                          decoration:  InputDecoration(
                                            hintText: 'Your experience on Police Burality',
                                        enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: new BorderSide(color: AppColor.primary,
                                        ),
                                    ),
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: new BorderSide(color: AppColor.primary
                                  ),

                            ),
                              hintStyle: AppTextStyle.subHeader2(context, Colors.grey),
                             // prefixIcon: Icon(Icons.message, color: Colors.grey, size: 16.0,)
                             labelText: 'Your experience'
                              
                            ),
                                ),
               ),

                  SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),

                      
                       Padding(
                 padding: const EdgeInsets.only(right: 10, left: 10.0),
                 child: TextField(
                                    cursorRadius: Radius.elliptical(30, 30),
                                   style: AppTextStyle.inputText(context),
                                   controller: emailController,
                                          decoration:  InputDecoration(
                                            hintText: 'Picture(Optional)',
                                        enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: new BorderSide(color: AppColor.primary,
                                        ),
                                    ),
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: new BorderSide(color: AppColor.primary
                                  ),

                            ),
                              hintStyle: AppTextStyle.subHeader2(context, Colors.grey),
                              prefixIcon: Icon(Icons.email, color: Colors.grey, size: 16.0,)
                              
                            ),
                                ),
               ),
               SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),

                      

                        //*****ERROR MESSAGE */
  _developerFunction.errorUimessage(errorMessage: model.displayMessage, type: model.displayMessageType, context: context),
    model.isBusy? _developerFunction.loadingWidget() : button(model, context),

    
             ],
           ),
         ),
       ),
        ),
    
    );
  }

  button(AddReportScreenViewModel model, BuildContext context){
   return  GestureDetector(
                      onTap: () {
                       //SEND DATA TO VM
                       
                       model.sendData(
                        id: id,
                        body: messageController.text,
                        city: "", // emailController.text,
                        state: "",
                        time: "",
                        title: titleController.text,);

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0 , bottom: 10.0),
                        child: ClayContainer(
      width: double.infinity,
                          height: ScreenUtil().setHeight(120),
                            borderRadius: 20,
                            color: AppColor.baseColor,
                            curveType: CurveType.concave,
                             child: Center(
                              child: Text(
                            "Send",
                            style: AppTextStyle.header4(context, AppColor.primary
                          ),
                        ),
  
                            ),
  
                          ),
                    )
   );
  }

}