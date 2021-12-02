import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:endsars/app.dart';
import 'package:endsars/locator.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  setupLocator();
  //Running main class  
  runApp(App());
}

