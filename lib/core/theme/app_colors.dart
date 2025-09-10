import 'package:flutter/material.dart';

class AppColors {
  // Primary colors from design
  static const Color primary = Color(0xFF34C759);
  static const Color primaryDark = Color(0xFF00D4AA);
  
  // Background colors
  static const Color backgroundStart = Color(0xFF1A1F3A);
  static const Color backgroundEnd = Color(0xFF2D3561);
  
  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFF6D6D80);
  
  // Button colors
  static const Color buttonGreenStart = Color(0xFF34C759);
  static const Color buttonGreenEnd = Color(0xFF00D4AA);
  
  // Utility colors
  static const Color surface = Color(0xFF2A2F4A);
  static const Color border = Color(0xFF3A3F5A);
  
  // Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [backgroundStart, backgroundEnd],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [buttonGreenStart, buttonGreenEnd],
  );
  
  static const LinearGradient logoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [buttonGreenStart, buttonGreenEnd],
  );
}
