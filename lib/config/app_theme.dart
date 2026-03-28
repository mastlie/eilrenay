import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // dark background
  //1F2625
  //293331
  //33403E

  //dark text color
  //858C8B
  //FFFFFF
  //CCCCCC
  static const double fontSize = 14;
  static const double iconSize = 16;
  static const double spacing = 10;
  static const double radiusSize = 6;
  static const Color darkPrimaryColor = Colors.deepOrange;
  static const TextStyle textFieldStyle = TextStyle(fontSize: fontSize);
  static const Color darkBackgroundColor = Color(0xFF1F2625);
  static const Color darkBackgroundLighterColor = Color(0xFF293331);
  static const Color darkBackgroundLightestColor = Color(0xFF33403E);
  static const Color darkForegroundColor = Color(0xFFFFFFFF);
  static const Color darkForegroundDarkerColor = Color(0xFFCCCCCC);
  static const Color darkForegroundDarkestColor = Color(0xFF858C8B);
  static const Color darkBorderColor = Color(0xFF555555);
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: darkPrimaryColor,
          brightness: Brightness.dark,
        ).copyWith(
          surface: darkBackgroundLightestColor,
          background: darkBackgroundColor,
          onSurface: darkForegroundColor,
          onBackground: darkForegroundDarkerColor,
          primary: darkPrimaryColor,
          onPrimary: darkForegroundColor,
        ),
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: darkBackgroundColor,
      titleTextStyle: TextStyle(
        color: Color(0xFFCCCCCC),
        fontSize: fontSize + 10,
      ),
      actionsIconTheme: IconThemeData(
        size: iconSize,
        color: darkForegroundDarkerColor,
        opacity: 0.8,
      ),
    ),

    // Card border radius
    cardTheme: CardThemeData(
      color: darkBackgroundLighterColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: darkBorderColor),
        borderRadius: BorderRadius.circular(radiusSize), // radius 6
      ),
    ),

    // TextField border radius
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: textFieldStyle,
      hintStyle: textFieldStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSize),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSize),
        borderSide: BorderSide(color: darkBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSize),
        borderSide: BorderSide(color: darkPrimaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSize),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSize),
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      filled: true,
      fillColor: darkBackgroundColor,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: darkBackgroundColor,
        foregroundColor: darkForegroundDarkerColor,
        padding: EdgeInsets.symmetric(vertical: spacing),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize),
          side: BorderSide(color: darkBorderColor),
        ),
      ),
    ),
    // Elevated Button border radius
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBackgroundColor,
        foregroundColor: darkForegroundDarkerColor,
        textStyle: TextStyle(fontSize: fontSize),
        iconSize: iconSize,
        padding: EdgeInsets.symmetric(vertical: spacing, horizontal: spacing),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize),
          side: BorderSide(color: darkBorderColor),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: darkForegroundDarkerColor,
        textStyle: TextStyle(fontSize: fontSize),
        iconSize: iconSize,
        padding: EdgeInsets.symmetric(vertical: spacing, horizontal: spacing),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkBackgroundLighterColor,
      selectedIconTheme: IconThemeData(
        size: iconSize + 6,
        color: darkPrimaryColor,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: fontSize - 2,
        color: darkPrimaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        size: iconSize + 6,
        color: darkForegroundDarkestColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: fontSize - 2,
        color: darkForegroundDarkestColor,
      ),
      selectedItemColor: darkPrimaryColor,
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: darkBackgroundLighterColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSize),
      ),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: darkBackgroundLighterColor,
      headerBackgroundColor: darkBackgroundLighterColor,
      headerForegroundColor: darkForegroundDarkerColor,
      locale: const Locale('en', 'US'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSize),
      ),
    ),

    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
  );
}
