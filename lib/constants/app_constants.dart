import 'package:flutter/material.dart';

class AppConstants {
  // Dimensions
  static const double defaultPadding = 16.0;
  static const double defaultSpacing = 20.0;
  static const double smallSpacing = 12.0;
  static const double tinySpacing = 8.0;
  static const double largeSpacing = 24.0;
  
  // Sizes
  static const double photoHeight = 200.0;
  static const double iconSize = 24.0;
  static const double largeIconSize = 32.0;
  static const double avatarRadius = 40.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  
  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color backgroundColor = Colors.white;
  static const Color placeholderColor = Color(0xFFE0E0E0);
  static const Color textColor = Color(0xFF333333);
  static const Color secondaryTextColor = Color(0xFF666666);
  
  // Text Styles
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: secondaryTextColor,
  );
  
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 14,
    color: textColor,
  );
}
