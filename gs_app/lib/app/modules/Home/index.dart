import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:gs_app/app/components/ActionButton.dart';
import 'package:gs_app/app/components/ViewPage.dart';
import 'package:gs_app/app/components/LabelText.dart';

import 'package:gs_app/app/modules/CrewMember/index.dart';
import 'package:gs_app/app/modules/LocalPlaces/index.dart';
import 'package:gs_app/app/modules/MarsDestinations/index.dart';

import 'package:gs_app/utils/utilsText.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home2State();
  }
}

class _Home2State extends State<Home> {
  showAlertDialog(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {},
    );
    Widget continuaButton = FlatButton(
      child: Text("Continar"),
      onPressed: () {},
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: new Text("Desenvolvedores"),
      content: new Text(
          "RM85316 - Antonio Carlos Alves G. F.,                               RM84596 - João Victor Marks F. D. ,                               RM85490 - Luís Fellipe M. O. B. ,                               3SIS"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
      pageTile: 'Home',
      body: SingleChildScrollView(
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
                  'assets/images/space2.gif',
                  width: 500,
                  height: 300,
                )),
            StandardText(
              label:
                  'Para entrar na tribulação é simples, basta colocar seu nome completo e CPF nos campos logo abaixo',
            ),
            const SizedBox(
              height: 20.0,
            ),
            StandardButton(
              buttonText: handlerCrewMember,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => CrewMembers()),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            StandardButton(
              buttonText: handlerCreateCrewMember,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MarsDestinations()),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            StandardButton(
              buttonText: handlerLocalPlaces,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => LocalPlaces()),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            StandardButton(
              buttonText: handlerNomesIntegrantes,
              onPressed: () {
                showAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
