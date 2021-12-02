//******************************************************************
// This file contain App Default Color that will use throughout the entire App
//***********************************************************************
import 'package:flutter/material.dart';

class AppColor {
  static const Color backgroundColor = Color(0xFFE5E5E5);
  static const Color primary = Color(0xFF599EF5);
  static const Color primaryLight = Color(0xFF4787CE);
  static const Color primaryDark = Color(0xFF22325C);

  static const Color secondary = Color(0xFFB20000);
   static const Color secondaryLight = Color(0xFFE21017);
    static const Color secondaryDark = Color(0xFF720E16);

     static const Color white = Color(0xFFFCFFFC);
      static const Color whiteGrey = Color(0xFFEBDDFF);
      static const Color black = Color(0xFF0F0D11); 
      static const otherBLue =  Color(0xFF4D70A6);
       static const Color board1_1 = Color(0xFF8F5EF7); 
       static const Color board1_2 = Color(0xFF473198);
       static const Color board2_1 = Color(0xFFb3e5fc);
        static const Color board2_2 = Color(0xFF22325C);
        static const Color board3_1 = Color(0xFFb3e5fc);
          static const Color board3_2 = Color(0xFFB20000);
           static const Color board4 = Color(0xFF4A0D67);
           static const Color baseColor = Color(0xFFE5E5E5);
           


  static const slider1 = const LinearGradient(
    colors: const [white, board1_2],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const slider2 = const LinearGradient(
    colors: const [board2_1, board2_2],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const slider3 = const LinearGradient(
    colors: const [board3_1, board3_2],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
   static const slider4 = const LinearGradient(
    colors: const [white, board4],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}