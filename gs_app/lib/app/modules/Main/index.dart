import 'package:flutter/material.dart';
import 'package:gs_app/app/modules/Onboarding/index.dart';
import 'package:gs_app/theme/themeConstants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Onboarding(),
    );
  }
}
