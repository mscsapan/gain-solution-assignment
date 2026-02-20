import 'package:flutter/material.dart';
import 'package:gain_solution_task/presentation/utils/utils.dart';

const primaryColor = Color(0xFF00A1E0);
const secondaryColor = Color(0xFFFE9900);
const blackColor = Color(0xFF3B3B3B);
const grayColor = Color(0xFF535769);
const cardBgColor = Color(0xFFF9FAFB);
const cardBorderColor = Color(0xFFD8E0ED);
const textRegular = Color(0xFF797979);
const textBorderRegular = Color(0xFF5C5D76);
const textLight = Color(0xFFB7B7B7);
Color hintTextColor = const Color(0xFF000000).withValues(alpha:0.2);

const greenColor = Color(0xFF22C55E);
const blueColor = Color(0xFF44A9F1);
const redColor = Color(0xFFFE2C55);
const whiteColor = Color(0xFFFFFFFF);
const yellowColor = Color(0xFFf1c233);

const scaffoldBgColor = Color(0xFFF9F9F9);
const grayBackgroundColor = Color(0xFFF3F4F8);
const Color borderColor = Color(0xFFE2E8F0);

const kDuration = Duration(microseconds: 300);

const Color transparent = Colors.transparent;
const double dialogHeight = 270.0;

///custom fonts
const String bold400 = 'Regular400';
const String bold500 = 'Regular500';
const String bold700 = 'Bold700';

///gradient colors
const buttonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFF885DF1), Color(0xFF6610F2)],
);

const activeTabButtonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFFFFC107), Color(0xFFFD7E14)],
);
const inactiveTabButtonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Colors.white, whiteColor],
);

const dialogCircleGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFFFFC107), Color(0xFFFD7E14)],
);

 InputBorder inputBorder = OutlineInputBorder(
    borderRadius: Utils.borderRadius(r: 50.0),
    borderSide: BorderSide.none
);
