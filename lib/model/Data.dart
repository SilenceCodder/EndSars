

import 'package:endsars/model/AddReportModel.dart';
import 'package:endsars/model/NewsModel.dart';
import 'package:flutter/material.dart';
import 'package:endsars/model/CategoryModel.dart';
import 'package:endsars/model/LocalAdvert.dart';
import 'package:endsars/model/SliderModel.dart';
import 'package:endsars/styles/AppImage.dart';



List<LocalAdvert> getLocalAdvertList() {
  List<LocalAdvert>  getLocalAdvert = [
    LocalAdvert(
      id: "1",
      image:AppImage.board1,
      location: "https://wa.me/+2348185951999?text=Hi,%20Am%20%20messaging%20you%20from%20Nairaland%20App%20I%20need%20a%20Mobile%20Application%20Thanks",
      name: "Hire Mobile Developer",
      rate: "4"
    ),
    LocalAdvert(
      id: "1",
      image: AppImage.board4,
      location: "",
      name: "OneDowloader",
      rate: "4"
    ),
  ];
  return getLocalAdvert;
}

List<CategoryModel> getCategoryList() {
  List<CategoryModel> getCategory = [
    CategoryModel(
        name: 'Action 1',
        icon: Icons.dashboard),
    CategoryModel(
       name: 'Action 2',
        icon: Icons.wb_sunny),
  
  ];
  return getCategory;
}

List<AddReportModel> getReportList() {
  List<AddReportModel>  getReport = [
    
    AddReportModel(
      id: "1",
      body: "I was on my way from work around 9pm and at he intersection at Maryland, at the point of crossing some people crossed the zebra crossing making me to stop, so the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers",
      time: "12,July 2020",
      city: "Edo",
      state: "JOS",
      title: "How Police Officers Harrased me at Maryland"
    ),

    AddReportModel(
      id: "1",
      body: "I was on my way from work around 9pm and at he intersection at Maryland, at the point of crossing some people crossed the zebra crossing making me to stop, so",
      time: "12,July 2020",
      city: "Edo",
      state: "JOS",
      title: "How Police Officers Harrased me at Maryland"
    ),

    AddReportModel(
      id: "1",
      body: "I was on my way from work around 9pm and at he intersection at Maryland, at the point of crossing some people crossed the zebra crossing making me to stop, so",
      time: "12,July 2020",
      city: "Edo",
      state: "JOS",
      title: "How Police Officers Harrased me at Maryland"
    ),
  ];
  return getReport;
}

List<NewsModel> getNewsList() {
  List<NewsModel>  getnews = [
    
    NewsModel(
      id: "1",
      body: "I was on my way from work around 9pm and at he intersection at Maryland, at the point of crossing some people crossed the zebra crossing making me to stop, so the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers",
      time: "12,July 2020",
      title: "Edo",
      image: "JOS",
      src: "How Police Officers Harrased me at Maryland",

    ),

    NewsModel(
      id: "1",
      body: "I was on my way from work around 9pm and at he intersection at Maryland, at the point of crossing some people crossed the zebra crossing making me to stop, so the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers",
      time: "12,July 2020",
      title: "Edo",
      image: "JOS",
      src: "How Police Officers Harrased me at Maryland",
    ),
    NewsModel(
       id: "1",
      body: "I was on my way from work around 9pm and at he intersection at Maryland, at the point of crossing some people crossed the zebra crossing making me to stop, so the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers the light changed to ReD while I was within the Zebra crossing. Two police officers",
      time: "12,July 2020",
      title: "Edo",
      image: "JOS",
      src: "How Police Officers Harrased me at Maryland",
    ),
  ];
  return getnews;
}


