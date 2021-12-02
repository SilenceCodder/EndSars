// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import 'package:endsars/styles/AppColor.dart';
// import 'package:endsars/styles/AppImage.dart';
// import 'package:endsars/viewmodel/WrapperViewModel.dart';

// class WrapperScreen extends StatefulWidget {
//   @override
//   _WrapperScreenState createState() => _WrapperScreenState();
// }

// class _WrapperScreenState extends State<WrapperScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  ViewModelBuilder<WrapperViewModel>.reactive(
//         viewModelBuilder: () => WrapperViewModel(),
//      onModelReady: (model) => model.handleStartUp(), //Handle Auth. Local DB etc, 
//       builder: (context, model, child) =>
//       Scaffold(
//         backgroundColor: AppColor.backgroundBlue,
//         body: Center(child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(AppImage.appLogo, width: 150,), //height: 100,
//              SizedBox(height: 5,), 
//             Text(AppText.slogan,
//               style: AppTextStyle.subHeader2(context, AppColor.black),),
//             SizedBox(height: 5,),
//             SizedBox(height: 30,),
//             SpinKitFadingCircle(color: Colors.blue, duration: new Duration(seconds: 2), ), //borderWidth: 5.0,
//           ],
//         )
//     )),)
//     );
//   }
// }

