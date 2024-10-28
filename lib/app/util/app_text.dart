import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kouple_app/app/util/app_color.dart';

class ApptexBold extends StatelessWidget {
  final String data;
  final double fontsize;
  final TextAlign? textAlign;
  final Color? color;

  ApptexBold(
      {super.key,
      required this.data,
      required this.fontsize,
      this.textAlign,
      this.color = black}) {
    if (fontsize < 6 || fontsize > 60) {
      throw ArgumentError('Font size must be between 8 and 60');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
          fontSize: fontsize, fontWeight: FontWeight.w900, color: color),
    );
  }
}

class AppTextMedium extends StatelessWidget {
  final String data;
  final Color? color;

  final double fontsize;

  final TextAlign? textAlign;

  AppTextMedium(
      {super.key,
      required this.data,
      required this.fontsize,
      this.textAlign,
      this.color = black}) {
    if (fontsize < 6 || fontsize > 60) {
      throw ArgumentError('this is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
          fontSize: fontsize, fontWeight: FontWeight.w400, color: color),
    );
  }
}

class AppText extends StatelessWidget {
  final String data;
  final double fontsize;
  final TextAlign? textAlign;
  final Color? color;

  AppText(
      {super.key,
      required this.data,
      required this.fontsize,
      this.textAlign,
      this.color = black}) {
    if (fontsize < 6 || fontsize > 60) {
      throw ArgumentError('this is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(fontSize: fontsize, color: color),
    );
  }
}
