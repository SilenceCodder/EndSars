
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:routeng/locator.dart';
// import 'package:routeng/services/AuthenticationService.dart';
// import 'package:routeng/services/navigation_service.dart';
// import 'package:routeng/util/constants.dart';
// import 'package:routeng/viewmodel/base_model.dart';

// class WrapperViewModel extends BaseModel{
// final AuthenticationService _authenticationService =
//       locator<AuthenticationService>();
//   final NavigationService _navigationService = locator<NavigationService>();
//    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future  handleStartUp()async{
//    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

//     if (hasLoggedInUser) {
//         //Check if User data is in the Database.
//         //IF YES, MOVE TO DASHBOD ELSE PROCESS REGISTRATION SCREEN\
//       checking();
      
//     } else {
//       _navigationService.navigateTowithoutBack(welcomeRoute);
//     }
//   }

//  checking()async{
//     var result = await _authenticationService.checkIfIDExist();

//     if(result){
// //YES DATA EXIST, MOVE TO DASHBOARD
//  _navigationService.navigateTowithoutBack(dashboardRoute);
// //_navigationService.navigateTowithoutBack(profileRoute);
//     }else{
//       //NO DOESN"T EXIST AT ALL, MOVE TO PROCEED SCREEN
//       _navigationService.navigateTowithoutBack(proceedRegRoute);
//     }
//  }


 
// }