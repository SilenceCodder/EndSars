import 'package:endsars/services/push_Notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/services/navigation_service.dart';
import 'package:endsars/utils/constants.dart';
import 'package:endsars/utils/customFunction.dart';

class DasbhboardViewModel extends BaseViewModel{
  String _fullName;
  String get getFullName => _fullName;
  String _message;

  final FirebaseAuth _auth = FirebaseAuth.instance;
   String get displayMessage => _message;
    int _messageType; //for displaying Error message or other Good message
   int get displayMessageType => _messageType;
    final CustomFunction _developerFunction = locator<CustomFunction>();
     final NavigationService _navigationService = locator<NavigationService>();
      final PushNotification _pushNotification = locator<PushNotification>();


     initialize()async{
       _pushNotification.initialise();
     }


addReportScreen(){
  _navigationService.navigateTo(addReportsRoute);
}

allReportScreen(){
  _navigationService.navigateTo(allReportsRoute);
}

newsScreen(){
  _navigationService.navigateTo(newsRoute);
}


ourDemand(){
  _navigationService.navigateTo(ourDemandRoute);
}



}