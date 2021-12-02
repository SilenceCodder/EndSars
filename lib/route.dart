import 'package:endsars/Screens/AddReportScreen.dart';
import 'package:endsars/Screens/ListofReportsScreen.dart';
import 'package:endsars/Screens/NewsScreen.dart';
import 'package:endsars/Screens/OurDemandScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:endsars/Screens/CheckInboxScreen.dart';
import 'package:endsars/Screens/DashbordScreen.dart';
import 'package:endsars/Screens/OnboardScreen.dart';
import 'package:endsars/Screens/SignwithEmailScreen.dart';
import 'package:endsars/Screens/WelcomeScreen.dart';
import 'package:endsars/utils/constants.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Onboard Screen Routing.
    case onboardRoute:
    return _getPageRoute(
       routeName: settings.name,
       viewToShow: OnboardScreen(),
     );

     //Splash Screen Routing.
    case welcomeRoute:
    return _getPageRouteTransition(
       viewToShow: WelcomeScreen(),
        pageTransitionType: PageTransitionType.rotate
     );

      //Login Screen Routing.
    case dashboardRoute:
    return _getPageRouteTransition(
       viewToShow: DashbordScreen(),
        pageTransitionType: PageTransitionType.scale
     );

     case addReportsRoute:
    return _getPageRouteTransition(
       viewToShow: AddReportScreen(),
        pageTransitionType: PageTransitionType.scale
     );

     case newsRoute:
    return _getPageRouteTransition(
       viewToShow: NewsListScreen(),
        pageTransitionType: PageTransitionType.topToBottom
     );

     case allReportsRoute:
    return _getPageRouteTransition(
       viewToShow: ListofReportsScreen(),
        pageTransitionType: PageTransitionType.rightToLeft
     );

     case ourDemandRoute:
    return _getPageRouteTransition(
       viewToShow: OurDemandScreen(),
        pageTransitionType: PageTransitionType.leftToRightWithFade
     );

//       //Register Screen Routing.
    case signiWithEmailRoute:
    return _getPageRouteTransition(
       viewToShow: SignwithEmailScreen(),
        pageTransitionType: PageTransitionType.leftToRightWithFade
     );

     case checkInboxRoute:
     var data = settings.arguments as String;
    return _getPageRouteTransition(
       viewToShow: CheckInboxScreen(email: data,),
        pageTransitionType: PageTransitionType.rightToLeftWithFade
     );

//      case dataRoute:
//     return _getPageRouteTransition(
//        viewToShow: DataBundle(),
//         pageTransitionType: PageTransitionType.leftToRightWithFade
//      );

//      case cableTvRoute:
//      return _getPageRouteTransition(
//        viewToShow: CableTvScreen(),
//         pageTransitionType: PageTransitionType.rightToLeftWithFade
//      );

//      case cableTvRoute:
//      return _getPageRouteTransition(
//        viewToShow: CableTvScreen(),
//         pageTransitionType: PageTransitionType.rightToLeftWithFade
//      );

//      case dashboardRoute:
//      return _getPageRouteTransition(
//        viewToShow: DasboardScreen(),
//         pageTransitionType: PageTransitionType.rightToLeftWithFade
//      );

   
//  case transactRoute:
//      return _getPageRouteTransition(
//        viewToShow: TransactionHistoryScreen(),
//         pageTransitionType: PageTransitionType.rightToLeftWithFade
//      );

//      //
//       case profileRoute:
//      return _getPageRouteTransition(
//        viewToShow: ProfileScreen(),
//         pageTransitionType: PageTransitionType.rightToLeftWithFade
//      );
    
       

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}


//***** ROUTE TYPE */

//Page Route without transition
PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
       
      ),
      builder: (_) => viewToShow);
}

//Page Route with Transition
PageRoute _getPageRouteTransition({Widget viewToShow, PageTransitionType pageTransitionType}) {
      return PageTransition(child: viewToShow, type: pageTransitionType, duration:  Duration(seconds: 1),
      );
}
