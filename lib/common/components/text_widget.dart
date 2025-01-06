import 'package:flutter/material.dart';
import 'package:molo/core/constants/color_constants.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text, this.textAlign});
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: 26,
          //  fontFamily: fontFamilyGeneral,
          fontWeight: FontWeight.bold,
          color: ColorConstants.blueColor),
    );
  }
}

class DescriptionTextWidget extends StatelessWidget {
  const DescriptionTextWidget({super.key, required this.text, this.textAlign});
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorConstants.darkBackgroundColorActivated),
    );
  }
}
