import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurDemandScreen extends StatefulWidget {
  @override
  _OurDemandScreenState createState() => _OurDemandScreenState();
}

class _OurDemandScreenState extends State<OurDemandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       backgroundColor: AppColor.baseColor,
            appBar: AppBar(
        title: Text("Our Demands(5FOR5)", style: GoogleFonts.sura(
                        fontSize: AppFontSizes.large,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: AppColor.white
                        ))
                    ),
        backgroundColor: AppColor.primaryDark,
        centerTitle: true,
        leading: GestureDetector(child: Icon(Icons.arrow_back,
         color: AppColor.white, size: 30,),
        onTap: (){
          Navigator.pop(context);
        },)
      ),
      body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClayContainer(
                    color: Color(0xFFE5E5E5), 
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 20,
                  curveType: CurveType.concave,
                    child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          AppImage.ourdemand,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  )),
      
    );
  }
}