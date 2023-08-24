import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

//Create custom AppTheme class to store all the colors used in the app and to create a custom theme for the app.
//This way, if we want to change the color scheme of the app, we can just change the colors here.
//This is a good practice to follow in general, as it makes it easier to change the color scheme of the app.
//This is because we only have to change the colors in one place, instead of having to change the colors in multiple places.
//This also makes it easier to keep track of the colors used in the app.
//Follow these brand colors for everything. Designate a primary color, secondary color, tertiary color, quaternary color, and quinary color.
//Then, use these colors for everything. That way, the app will have a consistent color scheme and if we want to change the color scheme of the app, we can just change the colors here.
//#f0ead9
// #c2454d
// #c26969
// #c38d86
// #c4b2a3

// const Color color1 = const Color(0xffc2454d);
// const Color color2 = const Color(0xffc26969);
// const Color color3 = const Color(0xffc38d86);
// const Color color4 = const Color(0xffc4b2a3);
// const Color color5 = const Color(0xfff0ead9);

const Color color1 = const Color(0xff2d6dee); // Blue
// const Color color1 = const Color(0xffc2454d);
// const Color color2 = Colors.white; // Light Taupe
const Color color2 = const Color(0xffc26969);
// const Color color3 = Colors.white; // Grayish Brown
//Light Sky Blue variation of Blue in color1
const Color color3 = Color.fromRGBO(45, 109, 238, 0.6);
const Color color4 = const Color(0xffFDFDFD); // Light Sky Blue
const Color color5 = Colors.white; // Very Light Gray
const textColor = Colors.black;

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      backgroundColor: color4,
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(
      color: color2,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: color1, width: 2),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: color2,
  ),
);

final appTheme = ThemeData(
  primaryColor: color1,
  primaryColorLight: color2,
  primaryColorDark: color3,
  accentColor: color4,
  backgroundColor: color5,
  scaffoldBackgroundColor: color5,
  cardColor: color5,
  canvasColor: color5,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: color1,
    selectedIconTheme: IconThemeData(
      color: color5,
    ),
    unselectedIconTheme: IconThemeData(
      color: color3,
    ),
    unselectedLabelStyle: TextStyle(
      color: color3,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: color1,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: color1,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: color1,
    focusColor: color5,
  ),
  iconTheme: const IconThemeData(
    color: color1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(color1),
    trackColor: MaterialStateProperty.all<Color>(color3),
    overlayColor: MaterialStateProperty.all<Color>(color4),
    thumbIcon: MaterialStateProperty.all<Icon>(Icon(Icons.lightbulb)),
    splashRadius: 10,
    materialTapTargetSize: MaterialTapTargetSize.padded,
  ),
  colorScheme: ColorScheme(
    primary: color1,
    primaryContainer: color2,
    secondary: color3,
    secondaryContainer: color4,
    surface: color5,
    background: color5,
    error: color1,
    onPrimary: color5,
    onSecondary: color5,
    onSurface: color1,
    onBackground: color1,
    onError: color5,
    brightness: Brightness.light,
  ),
  cardTheme: const CardTheme(
    color: color5,
  ),
  primarySwatch: MaterialColor(
    color1.value,
    <int, Color>{
      50: color1.withOpacity(0.1),
      100: color1.withOpacity(0.2),
      200: color1.withOpacity(0.3),
      300: color1.withOpacity(0.4),
      400: color1.withOpacity(0.5),
      500: color1.withOpacity(0.6),
      600: color1.withOpacity(0.7),
      700: color1.withOpacity(0.8),
      800: color1.withOpacity(0.9),
      900: color1.withOpacity(1.0),
    },
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: textColor,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(
      color: textColor,
      fontSize: 48,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: textColor,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: textColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: color5,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
