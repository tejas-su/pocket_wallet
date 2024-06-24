import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CtaButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Function()? onTap;
  final double height;
  final double radius;
  final double width;
  final Color color;
  final Color borderColor;
  final FontWeight fontWeight;
  const CtaButton(
      {super.key,
      this.fontWeight = FontWeight.w500,
      this.borderColor = Colors.transparent,
      this.color = Colors.deepPurpleAccent,
      required this.text,
      this.fontSize = 15,
      this.onTap,
      this.height = 60,
      this.radius = 20,
      this.width = 500});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0.4),
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
