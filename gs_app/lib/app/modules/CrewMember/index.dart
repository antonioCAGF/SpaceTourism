import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gs_app/app/components/ViewPage.dart';
import 'package:gs_app/app/components/TextForm.dart';
import 'package:gs_app/app/components/LabelText.dart';
import 'package:gs_app/app/components/ActionButton.dart';
import 'package:gs_app/app/components/ViewCardContent.dart';

import 'package:gs_app/models/CrewModel.dart';
import 'package:gs_app/utils/utilsText.dart';

class CrewMembers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CrewMembersState();
  }
}

class _CrewMembersState extends State<CrewMembers> {
  TextEditingController transactionNameEditingController =
      TextEditingController();
  TextEditingController transactioCpfEditingController =
      TextEditingController();
  FocusNode transactionNameFocus = FocusNode();
  FocusNode transactionValueFocous = FocusNode();

  List<CrewModel> transactionList = [
    CrewModel(
        transactionName: 'João Victor Marks de Farias Delgado',
        transactionCPF: '56798765498'),
    CrewModel(
        transactionName: 'Antonio Carlos Alves Guimarães Filho',
        transactionCPF: '56798765498'),
    CrewModel(
        transactionName: 'Igor Pereira da Silva',
        transactionCPF: '26578916578'),
    CrewModel(
        transactionName: 'Willian Augusto Rocha dos Santos',
        transactionCPF: '46789036787'),
    CrewModel(
        transactionName: 'Victor Chagas de Paiva',
        transactionCPF: '65478924519'),
    CrewModel(
        transactionName: 'Luís Fellipe Menedin Oliveira Balestrero',
        transactionCPF: '5978234591'),
  ];

  Future<void> _showDialog(
    String transactionName,
    String transactionCPF,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext conext) {
        return AlertDialog(
          title: Text(transactionName),
          content: SingleChildScrollView(
            child: Container(
              child: Text(
                'Numero do CPF do tripulante é $transactionCPF',
              ),
            ),
          ),
          actions: <Widget>[TextButton(onPressed: () {}, child: Text('ok'))],
        );
      },
    );
  }

  addNewCrewMember({
    required String transactionName,
    required String transactionCPF,
  }) {
    setState(
      () {
        transactionList.insert(
          0,
          CrewModel(
            transactionName: transactionName,
            transactionCPF: transactionCPF,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
      pageTile: 'Tripulação',
      body: SingleChildScrollView(
        child: Column(
          children: [
            StandardText(
              label:
                  'Coloque o nome completo e CPF dos novos tripulantes, logo abaixo',
            ),
            const SizedBox(
              height: 25,
            ),
            StandardTextForm(
              label: handlerFullName,
              focusNode: transactionNameFocus,
              userInputController: transactionNameEditingController,
              onEditingComplete: () {
                transactionValueFocous.nextFocus();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            StandardTextForm(
              label: handlerCPF,
              userInputController: transactioCpfEditingController,
              focusNode: transactionValueFocous,
            ),
            const SizedBox(
              height: 30,
            ),
            StandardButton(
              buttonText: handlerSubmit2,
              onPressed: () {
                addNewCrewMember(
                    transactionName: transactionNameEditingController.text,
                    transactionCPF: transactioCpfEditingController.text);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: transactionList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
              itemBuilder: (context, index) {
                var transactionItems = transactionList[index];
                return MouseRegion(
                  cursor: SystemMouseCursors.cell,
                  child: GestureDetector(
                    onTap: () {
                      _showDialog(
                        transactionItems.transactionName,
                        transactionItems.transactionCPF,
                      );
                      print(transactionItems.transactionName);
                      print(transactionItems.transactionCPF);
                    },
                    child: StandardCardContent(
                      leftText: transactionItems.transactionName,
                      rightText: transactionItems.transactionCPF,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
