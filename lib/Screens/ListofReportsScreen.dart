import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:endsars/Screens/ReportDetailsScreen.dart';
import 'package:endsars/model/Data.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppImage.dart';
import 'package:endsars/viewmodel/ListofReportModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';

class ListofReportsScreen extends StatefulWidget {
  @override
  _ListofReportsScreenState createState() => _ListofReportsScreenState();
}

class _ListofReportsScreenState extends State<ListofReportsScreen> {
  @override
  Widget build(BuildContext context) {
  return  ViewModelBuilder<ListofReportModel>.reactive(
        viewModelBuilder: () => ListofReportModel(),
       // onModelReady: (model) => model.initialize(),
        builder: (context, model, child) => 
        Scaffold(
          backgroundColor: AppColor.baseColor,
          appBar: AppBar(
        title: Text('List of Report', style: GoogleFonts.sura(
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
          body:  ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 10),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: getReportList().length,
      itemBuilder: (context, index) {
        return  Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 240.0,
            child: GestureDetector(
            child: Stack(
                children: <Widget>[
                 
                  Container(
                    padding:EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
                      child: ClayContainer(
                         curveType: CurveType.concave,
                         depth:40,
                           borderRadius: 20,
                        color: AppColor.baseColor,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50.0,),
                            Text(getReportList()[index].title, style: Theme.of(context).textTheme.title, ),
                            SizedBox(height: 5.0,),
                            Text('${getReportList()[index].state} State/${getReportList()[index].city}', style: Theme.of(context).textTheme.subhead,),
                            SizedBox(height: 10.0,),
                            Container(
                              height: 60.0,
                              child:  GestureDetector(
                                      child:  ListTile(
                                          title: 
                                          ReadMoreText(
                                          getReportList()[index].body,
                                          trimLines: 2,
                                          colorClickableText: Colors.pink,
                                          trimMode: TrimMode.Line,
                                          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                          textAlign: TextAlign.justify,
                                          trimCollapsedText: '...Show more',
                                          trimExpandedText: ' show less',
                                        ),
                                          subtitle:Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(getReportList()[index].time != null ? getReportList()[index].time : "Null",
  textAlign: TextAlign.right, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black))
                                          ),
                                        ),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ReportDetailsScreen(
                                    body: getReportList()[index].body,
                                    city: getReportList()[index].city,
                                    id: getReportList()[index].id,
                                    state: getReportList()[index].state,
                                    time: getReportList()[index].time,
                                    title: getReportList()[index].title,
                                  )));
                                    },
                                  )
                            )
                          ],
                        ),
                      ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage(AppImage.appLogo),),
                      ),
                    ],
                  ),
                ],
              ),
           onTap: (){
             Navigator.push(context, MaterialPageRoute(
                builder: (context) => ReportDetailsScreen(
                  body: getReportList()[index].body,
                  city: getReportList()[index].city,
                  id: getReportList()[index].id,
                  state: getReportList()[index].state,
                  time: getReportList()[index].time,
                  title: getReportList()[index].title,
                )));
           },
            ),
          );
      
      
      },
    )

        )
    
    );
  }
}