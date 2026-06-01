import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBg = Color(0xFFEAF8E7);

  /// 🇮🇳 BJP Theme Colors
  static const Color saffron = Color(0xFFFF6B00);
  static const Color saffronDark = Color(0xFFE65100);

  static const Color indiaGreen = Color(0xFF138A36);

  static const Color darkBlue = Color(0xFF0D1B52);

  static const Color greyText = Color(0xFF6B6B6B);

  static const Color white = Colors.white;

  static const Color lightBackground = Color(0xFFF5F6FA);

  static const Color primary = Color(0xFF4B3CF0);

  static const Color primaryDark = Color(0xFF2C1DB7);

  static const Color green = Color(0xFF4CAF50);

  static const Color orange = Color(0xFFFF9800);

  static const Color blue = Color(0xFF2196F3);

  static const Color textDark = Color(0xFF1A1A1A);

  static const secondary = Color(0xff123D8D);

  static const lightGreen = Color(0xffE8F8EE);

  static const yellow = Color(0xffF7C948);

  static const red = Color(0xffEF4444);

  static const textLight = Color(0xff64748B);

  static const border = Color(0xffE2E8F0);

  static const background = Color(0xffF8FAFC);

  static const Color cardShadow = Color(0x14000000);

  static const Color success = Color(0xFF22C55E);

  static const Color warning = Color(0xFFF59E0B);

  static const Color info = Color(0xFF3B82F6);

  static const Color cardBg = Color(0xFFFFFFFF);

  static const Color divider = Color(0xFFE5E7EB);

  /// 🔥 Premium Saffron Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [saffron, saffronDark, Color(0xFFFF8F00)],
  );
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
  );
}
