import 'package:flutter/material.dart';
import 'package:gs_app/app/components/ActionButton.dart';
import 'package:gs_app/app/components/LabelText.dart';
import 'package:gs_app/app/components/TextForm.dart';
import 'package:gs_app/app/modules/Home/index.dart';
import 'package:gs_app/utils/paddingSizes.dart';
import 'package:gs_app/utils/utilsText.dart';

// ignore: use_key_in_widget_constructors
class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Home()),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/space5.gif',
                    width: 500,
                    height: 300,
                  )),
              StandardText(
                label:
                    "Um pequeno passo para o homem, mas um gigantesco salto para a humanidade, falta pouco para você fazer parte da tribulação",
              ),
              const SizedBox(
                height: 15.0,
              ),
              StandardTextForm(
                label: handlerEMail,
              ),
              const SizedBox(
                height: 15.0,
              ),
              StandardTextForm(
                label: handlerPassword,
              ),
              const SizedBox(
                height: 15.0,
              ),
              StandardButton(
                buttonText: handlerSubmit,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Home()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
