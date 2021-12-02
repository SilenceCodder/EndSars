import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailsScreen extends StatefulWidget {
    final String id, time, title, body, src, image;

  const NewsDetailsScreen({this.id, this.time, this.title, this.body, this.src, this.image});
  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColor.baseColor,
             appBar: AppBar(
        title: Text(widget.title, style: GoogleFonts.sura(
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
            padding: const EdgeInsets.only(top: 1.0),
            child: Container(
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0, bottom: 10.0),
                    child: ClayContainer(
                       curveType: CurveType.concave,
                       depth:40,
                         borderRadius: 20,
                      color: AppColor.baseColor,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.title, textAlign:
                                    TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold,fontSize: AppFontSizes.medium,
                                    fontStyle: FontStyle.normal, ) ),
                          ),
                          SizedBox(height: 5.0,),
                          Text('${widget.src}', style: Theme.of(context).textTheme.subhead,),
                          SizedBox(height: 10.0,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                      title:Text(widget.body, textAlign:
                                    TextAlign.justify, style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.0,
                                    fontStyle: FontStyle.italic),),
                                      subtitle:Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(widget.time != null ? widget.time : "Null",
  textAlign: TextAlign.right, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black))
                                      ),
                                    ),
                                ),
                              ],
                            ),
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
                        backgroundImage: AssetImage(widget.image),),
                    ),
                  ],
                ),
              ],
            ),
        ),
          )
      
    );
  }
}