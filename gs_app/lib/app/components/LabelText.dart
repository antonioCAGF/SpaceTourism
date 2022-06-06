import 'package:flutter/material.dart';
import 'package:gs_app/theme/AlternativeTheme.dart';

class StandardText extends StatelessWidget {
  final String label;

  StandardText({required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        label,
        textAlign: TextAlign.start,
        style: AlternativeTheme.of(context).bodyText1.override(
              fontFamily: 'Poppins',
              color: Color(0xFF3D3D4D),
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}
