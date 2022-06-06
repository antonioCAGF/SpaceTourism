import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final Function()? onTap;
  final String cardTitle;

  StandardCard({required this.onTap, required this.cardTitle});  


  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2)
        ),
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 5) ,
        child: Row(
          children: [
            Text(cardTitle, style: TextStyle(fontSize: 25),),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.lime,)
          ],
        )),
    );
  }
}