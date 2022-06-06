import 'package:flutter/material.dart';

class StandardCardContent extends StatelessWidget {
  final String? leftText;
  final String rightText;

  StandardCardContent({required this.leftText, this.rightText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black87, width: 2)),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Text(
            leftText!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Text(
            rightText,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
