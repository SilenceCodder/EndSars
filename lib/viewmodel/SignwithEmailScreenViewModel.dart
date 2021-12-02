import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/services/navigation_service.dart';
import 'package:endsars/utils/constants.dart';
import 'package:endsars/utils/customFunction.dart';

class SignwithEmailScreenViewModel extends BaseViewModel{
String _errorMessage;
String get errorM => _errorMessage;
int _errorMessageType = 0;
int get errorType => _errorMessageType;

final NavigationService _navigationService = locator<NavigationService>();
 final CustomFunction _customFuntion = locator<CustomFunction>();
 final FirebaseAuth _auth = FirebaseAuth.instance;

 signIn(String email)async{
   showMessage(error: null);
if(email.isEmpty){
showMessage(error: 'Email required');
  
  } else if(email != null){
    print('Am here');
     String check = _customFuntion.validateEmail(email);
    
     if(check != null){
        showMessage(error: 'The email you entered is invalid', type: 1);

       }else if(email.isNotEmpty){
         setBusy(true);
     bool sent = await _sendLinkToProvidedEmail(providedEmail: email);
     if(sent){

       _navigationService.navigateTo(checkInboxRoute, arguments: email);  
     }else{
       showMessage(error: 'Not Send', type: 0);
     }
  
  }
  }
 }
 
 showMessage({String error, int type}){
_errorMessage = error;
_errorMessageType = type;
notifyListeners();
}

Future<bool> _sendLinkToProvidedEmail({String providedEmail}) async {
  try {
  _auth.sendSignInLinkToEmail(
    email: providedEmail,
    actionCodeSettings: ActionCodeSettings(
            url: Constants.passwordlessDynamicUrl,
            androidInstallApp: true,
            androidPackageName: "com.harbdollar.valueformoney",
            iOSBundleId: "com.harbdollar.valueformoney",
            androidMinimumVersion: "18",
            handleCodeInApp: true,
          ),
  );
 } catch (e) {
      return false;
  }
    return true;
}
 
}