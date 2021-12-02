import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/services/navigation_service.dart';
import 'package:endsars/utils/constants.dart';
import 'package:endsars/utils/customFunction.dart';
import 'package:endsars/utils/sign_in.dart';

class WelcomeViewModel extends BaseViewModel{
  String _message;

  final FirebaseAuth _auth = FirebaseAuth.instance;
   String get displayMessage => _message;
    int _messageType; //for displaying Error message or other Good message
   int get displayMessageType => _messageType;
    final CustomFunction _developerFunction = locator<CustomFunction>();
     final NavigationService _navigationService = locator<NavigationService>();

//SignIn with Google
withGoogle()async{
clearErrorMessage(); //clear error messgae
  setBusy(true); //showMessage
  try{
    
    GoogleSignInAccount account = await googleSignIn.signIn();
  // if(account == null){
  //     setBusy(false); 
  //     showMessage(msg: 'Account is Null', type: 0);
    
  // }else{
   
  // }
   GoogleSignInAuthentication googleSignInAuthentication = await account.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
   // print('*******ACCESS TOKEN ${googleSignInAuthentication.accessToken}');

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;
      _developerFunction.saveEmailandID(email: user.email, name: user.displayName);
      _navigationService.navigateTowithoutBack(dashboardRoute,);
    showMessage(msg: 'Successful, ${user.displayName}!!', type: 1);
     setBusy(false); 

  }catch(e){
    print(e.toString());
     showMessage(msg: e.toString(), type: 0);
      setBusy(false);
  }
}

//with EMail
withEmail()async{
_navigationService.navigateTo(signiWithEmailRoute);
}

//with Apple
withApple(){

}

//ErrorInput Code implementation
  showMessage({String msg, int type}){
     _message  = msg;
     _messageType = type;
    notifyListeners();
  }

  clearErrorMessage(){
      _message  = null;
     _messageType = null;
     notifyListeners();
  }

}