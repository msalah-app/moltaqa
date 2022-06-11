import 'package:flutter/material.dart';
import 'package:moltaqa/styles/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

// class AppTheme {
//   AppTheme._();

const Color appBackgroundColor = Color(0xFFFFF7EC);
const Color subTitleTextColor = Color(0xFF9F988F);

Color textColor = const Color(0xFF0D0D0D);
Color whiteColor = Colors.white;
Color blackColor = const Color(0xff131111);

Color redTextColor = const Color(0xFFCA252B);
Color lightRedColor = const Color(0xFFDE4040);
Color lightBlueColor = const Color(0xFFBFE2FF);

Color greyColor = const Color(0xFF7C7D7E);


Color backGroundColor = const Color(0xffF6F2F2);

Color whiteTextColor = const Color(0xFFFFFFFF);
Color greyTextColor = const Color(0xFF0E0E0F);
Color blackTextColor = const Color(0xFF202224);
Color bottomTextColor = const Color(0xfff3f2f2);





final TextTheme lightTextTheme = TextTheme(
    overline: text8.copyWith(color: textColor,fontWeight: FontWeight.bold),
  caption: text10.copyWith(color: textColor,fontWeight: FontWeight.bold),
    bodyText2: text12.copyWith(color: textColor,fontWeight: FontWeight.bold),
  subtitle2: text14.copyWith(color: textColor,fontWeight: FontWeight.bold),
  bodyText1: text16.copyWith(color: textColor,fontWeight: FontWeight.bold),
);

final TextTheme darkTextTheme = TextTheme(
  overline: text8,
  caption: text10,
  bodyText2: text12,
  subtitle2: text14,
  bodyText1: text16,
);


final TextStyle text8 = GoogleFonts.tajawal(
  fontSize: 1.20 * SizeConfig.textMultiplier,
    color: textColor,fontWeight: FontWeight.bold
);
final TextStyle text10 = GoogleFonts.tajawal(
  fontSize: 1.35 * SizeConfig.textMultiplier,
    color: textColor,fontWeight: FontWeight.bold
);
final TextStyle text12 = GoogleFonts.tajawal(
  fontSize: 1.62 * SizeConfig.textMultiplier,
    color: textColor,fontWeight: FontWeight.bold,

);
final TextStyle text14 = GoogleFonts.tajawal(
  fontSize: 1.9 * SizeConfig.textMultiplier,
    color: textColor,fontWeight: FontWeight.bold
);
final TextStyle text16 = GoogleFonts.tajawal(
  fontSize: 2.16 * SizeConfig.textMultiplier,
    color: textColor,fontWeight: FontWeight.bold
);




