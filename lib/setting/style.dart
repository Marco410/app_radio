import 'package:flutter/material.dart';
import 'package:mtm/setting/dimensions.dart';

class colorStyle {
  static final primaryColor = Color(0xff00CCFE);
  static final secondaryColor = Color(0xff344A88);
  static final orangeColor = Color(0xff76ECFE);
  static final hintColor = Color(0xFFAAAAAA);
  static final hintSecondColor = Color(0xFF5F6969);
  static final hintThirdColor = Color(0xFF888888);
  static final hintForthColor = Color(0xFFEFEFEF);
  static final blackColor = Color(0xFF333333);
  static final thirdColor = Color(0xFF3DA4FD);
  //static final primaryColor = Color(0xFF45C2DA);
  // static final background = Color(0xFF191B2A);
  static final background = Color.fromRGBO(238, 238, 238, 1.0);
  static final cardColorLight = Colors.white;
  static final cardColorDark = Colors.black;
  static final fontColorLight = Color(0xFF656565);
  static final fontColorDark = Colors.white;
  static final fontSecondaryColorLight = Colors.black26;
  static final fontSecondaryColorDark = Colors.white24;
  static final iconColorLight = Colors.black;
  static final iconColorDark = Colors.white;
  static final fontColorDarkTitle = Color(0xFF32353E);
  static final grayBackground = Color(0xFF172E4D);
  static final whiteBacground = Color(0xFFF4F5F7);
  // static final grayBackground = Color(0xFF16223A);
  static final blackBackground = Color(0xFF12151C);
  static final bottomBarDark = Color(0xFF202833);
}

class txtStyle {
  static final titleCard = TextStyle(
      fontFamily: "Inter",
      fontSize: 17,
      color: colorStyle.hintSecondColor,
      fontWeight: FontWeight.w700);

  static final headerStyle = TextStyle(
      fontFamily: "Popins",
      fontSize: 19,
      fontWeight: FontWeight.w800,
      color: colorStyle.blackColor,
      letterSpacing: 1.5);

  static final subtitle = TextStyle(
      fontFamily: "Popins",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: colorStyle.hintSecondColor,
      letterSpacing: 2);

  static final textHint = TextStyle(
      fontFamily: "Roboto",
      fontSize: Dimensions.font14,
      color: colorStyle.hintThirdColor,
      fontWeight: FontWeight.w500);

  static final textBoldWhiteStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: Dimensions.font13,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static final textTitleBlogWhiteStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font14,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static final textDesBlogWhiteStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font12,
      color: Colors.white,
      fontWeight: FontWeight.w400);

  static final textLinkBlogWhiteStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font13,
      color: Colors.white,
      fontWeight: FontWeight.w700);

  static final descriptionStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font14,
      color: Colors.black87,
      fontWeight: FontWeight.normal);

  static final descriptionWhiteStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: Dimensions.font14,
      color: Colors.white70,
      fontWeight: FontWeight.w400);

  static final hintStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font14,
      color: colorStyle.hintColor,
      fontWeight: FontWeight.normal);

  static final hintDarkStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font12,
      color: colorStyle.hintThirdColor,
      fontWeight: FontWeight.normal);

  static final titlePageWhite = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font16,
      color: Colors.white,
      fontWeight: FontWeight.normal);

  static final titleSecondInnerPage = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font21,
      color: colorStyle.blackColor,
      fontWeight: FontWeight.w700);

  static final bodyText = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font14,
      color: colorStyle.blackColor,
      height: 2,
      fontWeight: FontWeight.w500);

  static final bodyExpandedText = TextStyle(
      fontFamily: "Inter",
      fontSize: Dimensions.font12,
      color: colorStyle.blackColor,
      height: 2,
      fontWeight: FontWeight.w500);
}
