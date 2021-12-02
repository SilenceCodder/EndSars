import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:endsars/Screens/WelcomeScreen.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/services/navigation_service.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:endsars/styles/AppText.dart';
import 'package:endsars/utils/constants.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int page = 0;
  NavigationService _navigationService = locator<NavigationService>();
   PageController _controller = PageController(initialPage: 0, viewportFraction: 1.0);
  int index = 0;
  int  pageLength = 4;
  LiquidController controller = LiquidController();
  
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
        body: LiquidSwipe(
      pages: [
        Container(
      decoration: BoxDecoration(
        gradient: AppColor.slider1
    ),
    child: Stack(
          children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            AppImage.board1,
           // fit: BoxFit.cover,
          ),
          Padding(padding: const EdgeInsets.all(20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                    AppText.board1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sura(
                        fontSize: AppFontSizes.medium,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColor.white
                        )
                    )
              ),
                 ),
               ),

            ],
          ),
         
        ],
      ),
       Positioned(
            bottom: 30.0,
            left: 0.0,
            right: 0.0,
            child:  Container(
              //color: AppColor.board1_2,
              padding: const EdgeInsets.all(20.0),
              child: DotsIndicator(
                dotsCount: pageLength,
                position: 0.0,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(30.0, 8.0),
                  activeColor: AppColor.primaryDark,
                  color: Colors.white,
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
)
            )
          )
          ],
        ),
    
        ),
    
    Container(
     decoration: BoxDecoration(
        gradient: AppColor.slider2
    ),
      child: Stack(
        children: [
           Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            AppImage.board2,
           // fit: BoxFit.cover,
          ),
          Padding(padding: const EdgeInsets.all(20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      AppText.board2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sura(
                          fontSize: AppFontSizes.medium,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColor.white
                          )
                      )
                  ),
                ),
              ),

            ],
          ),
          
        ],
      ),
       Positioned(
            bottom: 30.0,
            left: 0.0,
            right: 0.0,
            child:  Container(
              //color: AppColor.board1_2,
              padding: const EdgeInsets.all(20.0),
              child: DotsIndicator(
                dotsCount: pageLength,
                position: 1.0,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(30.0, 8.0),
                  activeColor: AppColor.primaryDark,
                  color: Colors.white,
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
)
            )
          )
    
        ],
      )
    ),

  
    Container(
     decoration: BoxDecoration(
        gradient: AppColor.slider3
    ),
      child: Stack(
        children: [
           Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         Image.asset(
            AppImage.board3,
           fit: BoxFit.cover,
          ),
          Padding(padding: const EdgeInsets.all(20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                     AppText.board3,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sura(
                          fontSize: AppFontSizes.medium,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColor.white
                          )
                      )
                  ),
                ),
              ),

            ],
          ),
          
        ],
      ),
       Positioned(
            bottom: 30.0,
            left: 0.0,
            right: 0.0,
            child:  Container(
              //color: AppColor.board1_2,
              padding: const EdgeInsets.all(20.0),
              child: DotsIndicator(
                dotsCount: pageLength,
                position: 2.0,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(30.0, 8.0),
                  activeColor: AppColor.primaryDark,
                  color: Colors.white,
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
)
            )
          ) 
        ],
      )
    ),
     Container(
    decoration: BoxDecoration(
        gradient: AppColor.slider4
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            AppImage.board4,
           // fit: BoxFit.cover,
          ),
          Padding(padding: const EdgeInsets.all(20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                     AppText.board4,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sura(
                          fontSize: AppFontSizes.medium,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColor.white
                          )
                      )
                  ),
                ),
              ),

            ],
          ),          GestureDetector(
                      onTap: () async{
                      _navigationService.navigateTo(welcomeRoute);
                //         Navigator.push(context, MaterialPageRoute(
                // builder: (context) => DashboardScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0 ),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: AppColor.primaryDark,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: AppColor.primaryLight.withOpacity(0.2),
                                    blurRadius: 16),
                                BoxShadow(
                                    offset: Offset(-10, -10),
                                    color: AppColor.primaryLight.withOpacity(0.2),
                                    blurRadius: 10),
                              ]),
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.alef(
        fontSize: AppFontSizes.large2, textStyle: TextStyle(color: Colors.white)
                          ),)
                        ),
                      ),
                    ),
        ],
      ),
    ),
   ],
      onPageChangeCallback: (value) {
       
      },
      liquidController: controller,
      fullTransitionValue: 500,
      enableSlideIcon: false,
        )));
  }
 

}