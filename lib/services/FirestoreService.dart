
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endsars/model/AddReportModel.dart';

class FirestoreService{
final CollectionReference _userCollectionReference =  FirebaseFirestore.instance.collection('Reports');


sendFeedBack(AddReportModel sendFeedBackModel)async{
try{
   await _userCollectionReference.doc(sendFeedBackModel.id).set(
      sendFeedBackModel.toJson());
  }catch(e){
    return e.message; 
  }
}

}