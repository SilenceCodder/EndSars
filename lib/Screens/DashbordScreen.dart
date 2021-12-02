import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:endsars/styles/AppTextStyle.dart';
import 'package:endsars/utils/customFunction.dart';
import 'package:endsars/viewmodel/DasbhboardViewModel.dart';
import 'package:endsars/widget/SliderImage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashbordScreen extends StatefulWidget {
  @override
  _DashbordScreenState createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> with SingleTickerProviderStateMixin {
  //Color baseColor = Color(0xFFEBDDFF);
//AnimationController animationController;
  double firstDepth = 50;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  AnimationController _animationController;
   final CustomFunction _developerFunction = locator<CustomFunction>();
   // SET ICONS HERE

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
     
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
        stagger(firstDepth, _animationController.value, 0.25);
    double calculatedSecondDepth =
        stagger(secondDepth, _animationController.value, 0.5);


    return ViewModelBuilder<DasbhboardViewModel>.reactive(
        viewModelBuilder: () => DasbhboardViewModel(),
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) => 
         Container(
           color: AppColor.baseColor,
           child: Scaffold(
      backgroundColor: AppColor.baseColor,
      body: Column(
        children: [
           SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            SliderImage(),
             SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
      Container(
        height: MediaQuery.of(context).size.height / 6,
       width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
 selectUI( name: "Add Reports", value: calculatedFirstDepth, icon: Icons.add_circle_outline, index: 0, model: model),
selectUI( name: "Reports", value: calculatedSecondDepth, icon: Icons.report, index: 1, model: model),
SizedBox(
                  width: 8
                ),
selectUI( name: "News", value: calculatedSecondDepth, icon: MdiIcons.newspaper,index: 2, model: model),

   selectUI(name: "Our Demands", value: calculatedSecondDepth, icon: MdiIcons.humanHandsup, index: 3, model: model),
                  
          ],
        ),
      ),
            

            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Lastest Reports', style: AppTextStyle.header1(
      color: AppColor.black,context: context,
      fontWeight: FontWeight.bold,
      size: AppFontSizes.medium
    ),),

        Row(
          children: [
             Text('See all', style: AppTextStyle.header1(
      color: AppColor.black,context: context,
      fontWeight: FontWeight.normal,
      size: AppFontSizes.medium
    ),),
     Icon(Icons.list, size: 30, color: AppColor.primary,),
          ],
        )
                   
                ],),
                  ),
        ],
      ),
   )
         )

    );
    
  }

   Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Great", //Hello
                  textAlign: TextAlign.left,
                  style: GoogleFonts.sura(
                          fontSize: AppFontSizes.medium,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey
                          )
                      )
                ),
                Text(
                  "Nigerian Youth",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.sura(
                          fontSize: AppFontSizes.medium,
                          textStyle: TextStyle(
                             fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 0.27,
                    color: AppColor.black
                          )
                      )
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset(AppImage.userimage),
          )
        ],
      ),
    );
  }

  selectUI({String name, IconData icon, double value, int index, DasbhboardViewModel model}){ //, IconData icon
return GestureDetector(
  child:   Container(
  
    margin: EdgeInsets.only(left: 14),
  
    child:  Column(
  
      children: [
  
         ClayContainer(
  
    
  
                          height: 70,
  
                              width: 70,
  
    
  
                            borderRadius: 20,
  
    
  
                            color: AppColor.baseColor,
  
    
  
                            depth: value.toInt(),
  
    
  
                            curveType: CurveType.concave,
  
    
  
                             child: Center(
  
                              child: Icon(icon, size: 40,)
  
                            ),
  
                          ),
  
                          SizedBox(
  
                height:13
  
              ),
  
                      Text(name ,
  
                          style: AppTextStyle.header1(
  
        color: AppColor.black,context: context,
  
        fontWeight: FontWeight.bold,
  
        size: AppFontSizes.medium
  
      ))
  
      ],
  
    )
  
  ),
  onTap: (){
      if(index == 0){
        //AddReport
        model.addReportScreen();
      }else if(index == 1){
        //Report list
        model.allReportScreen();

      }else if(index == 2){
        //News
        model.newsScreen();

      }else if(index == 3){
        //Our deman
        model.ourDemand();
      }
  },
);
  }
}