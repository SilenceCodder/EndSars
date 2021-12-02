import 'package:endsars/locator.dart';
import 'package:endsars/model/AddReportModel.dart';
import 'package:endsars/services/FirestoreService.dart';
import 'package:stacked/stacked.dart';

class AddReportScreenViewModel extends BaseViewModel{
  String _message; //for displaying Error message or other Good message
  String get displayMessage => _message;
  int _messageType; //For displaying error message type 1 = Red, 2 => Green
   int get displayMessageType => _messageType;
     final FirestoreService _firestoreService = locator<FirestoreService>();


 sendData({String id, String body, String city, String state, String title, String time})async{
showMessage(msg: null);
   if(body.isEmpty || state.isEmpty || title.isEmpty){
      showMessage(msg: 'All field must be fill', type: 0);
   }else{
       setBusy(true);

 try{
     var result =  await _firestoreService.sendFeedBack(AddReportModel(
          id: id,
          body: body,
          city:city,
          state: state,
          title: title,
          time: time
          ));

          if(result is String){
             setBusy(false);
            showMessage(msg: 'Could not send Feedback', type: 0);
          }else{
              setBusy(false);
               showMessage(msg: 'Successfully send.', type: 1);
           
          }
            setBusy(false);

 }catch(e){
   showMessage(msg: e.toString(), type: 0);
    setBusy(false);
 }

   }
  
 }

 //FOr displaying Message
showMessage({String msg, int type}){
  _message = msg;
  _messageType = type;
  notifyListeners();
}
}