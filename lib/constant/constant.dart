import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryBgColor = Colors.blueGrey;
const Color secondBgColor = Colors.lightBlue;

const Color primaryTextColor = Color.fromARGB(255, 0, 36, 219);
const Color secondTextColor = Color.fromARGB(255, 137, 137, 137);
const Color highlightTextColor = Colors.blue;

final Head = GoogleFonts.poppins(
  fontSize: 28,
  color: primaryTextColor,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.italic,
);

final SubHead = GoogleFonts.poppins(
  fontSize: 16, 
  color: secondTextColor, 
  fontWeight: FontWeight.w500
);

final ButtonText = GoogleFonts.poppins(
  color: Colors.white, 
  fontSize: 20, 
  fontWeight: FontWeight.w600
);

final TextLink = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: highlightTextColor,
);

final SubText = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: secondTextColor,
);


