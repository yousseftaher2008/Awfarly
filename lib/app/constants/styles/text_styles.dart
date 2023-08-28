import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//weights values
const TextStyle _boldWeight = TextStyle(fontWeight: FontWeight.bold);
const TextStyle _lightWeight = TextStyle(fontWeight: FontWeight.w300);
//sizes
TextStyle _h1Size = TextStyle(fontSize: 28.sp);
TextStyle _h2Size = TextStyle(fontSize: 24.sp);
TextStyle _h3Size = TextStyle(fontSize: 18.sp);
TextStyle _h4Size = TextStyle(fontSize: 16.sp);
TextStyle _h6Size = TextStyle(fontSize: 12.sp);
// default colors
const TextStyle _primaryColor = TextStyle(color: primaryColor);
const TextStyle _whiteColor = TextStyle(color: Colors.white);
const TextStyle _blackColor = TextStyle(color: Colors.black);
const TextStyle _secondaryColor = TextStyle(color: secondaryColor);
const TextStyle _grey2Color = TextStyle(color: Color(0XFFDDDDDD));

//? values

//? h1
TextStyle h1Primary = _boldWeight.merge(_h1Size).merge(_primaryColor);
TextStyle h1Black = _boldWeight.merge(_h1Size).merge(_blackColor);

//? h2
TextStyle h2 = _boldWeight.merge(_h2Size).merge(_primaryColor);
TextStyle h2Black = _boldWeight.merge(_h2Size).merge(_blackColor);

//? h3 regular
TextStyle h3RegularPrimary = _h3Size.merge(_primaryColor);
TextStyle h3RegularGrey = _h3Size.merge(_grey2Color);
TextStyle h3RegularBlack = _h3Size.merge(_blackColor);
TextStyle h3RegularWhite = _h3Size.merge(_whiteColor);

//? h3 bold
TextStyle h3BoldGrey = _boldWeight.merge(_h3Size).merge(_secondaryColor);
TextStyle h3BoldWhite = _boldWeight.merge(_h3Size).merge(_whiteColor);
TextStyle h3BoldRed = _boldWeight.merge(_h3Size).copyWith(color: dangerColor);
TextStyle h3BoldPrimary =
    _boldWeight.merge(_h3Size).copyWith(color: primaryColor);
TextStyle h3BoldBlack = _boldWeight.merge(_h3Size).merge(_blackColor);

//? h4 regular
TextStyle h4RegularPrimary = _h4Size.merge(_primaryColor);
TextStyle h4RegularBlack = _h4Size.merge(_blackColor);
TextStyle h4RegularGrey = _h4Size.merge(_secondaryColor);
TextStyle h4RegularGrey2 = _h4Size.copyWith(color: const Color(0XFFCBCBCB));
TextStyle h4RegularWhite = _h4Size.merge(_whiteColor);
TextStyle h4RegularRed = _h4Size.copyWith(color: dangerColor);

//? h4 bold
TextStyle h4BoldWhite = _boldWeight.merge(_h4Size).merge(_whiteColor);
TextStyle h4BoldBlack = _boldWeight.merge(_h4Size).merge(_blackColor);
TextStyle h4BoldPrimary = _boldWeight.merge(_h4Size).merge(_primaryColor);
TextStyle h4BoldOrange =
    _boldWeight.merge(_h4Size).copyWith(color: const Color(0xFFFB8C00));

//? h5 regular
const TextStyle h5RegularPrimary = _primaryColor;
const TextStyle h5RegularBlack = _blackColor;
const TextStyle h5RegularGrey = _secondaryColor;
const TextStyle h5RegularGrey2 = _grey2Color;
const TextStyle h5RegularWhite = _whiteColor;
const TextStyle h5RegularYellow = TextStyle(color: Color(0xFFF0BF41));

//? h5 bold
TextStyle h5Bold = _boldWeight.merge(_primaryColor);

//? h6 light
TextStyle h6Light = _lightWeight.merge(_h6Size).merge(_secondaryColor);

//? h6 regular
TextStyle h6RegularBlack = _h6Size.merge(_blackColor);
TextStyle h6RegularGrey = _h6Size.merge(_secondaryColor);
TextStyle h6RegularWhite = _h6Size.merge(_whiteColor);

//? h6 bold
TextStyle h6Bold = _boldWeight.merge(_h6Size).merge(_whiteColor);
