import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gs_app/app/components/ViewCardContent.dart';

import 'package:gs_app/app/components/ViewPage.dart';
import 'package:gs_app/app/components/TextForm.dart';
import 'package:gs_app/app/components/LabelText.dart';
import 'package:gs_app/app/components/ActionButton.dart';

import 'package:gs_app/utils/utilsText.dart';
import 'package:gs_app/models/MarsDestinationsModel.dart';

class MarsDestinations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MarsDestinationsState();
  }
}

class _MarsDestinationsState extends State<MarsDestinations> {
  TextEditingController destinationLocationEditingController =
      TextEditingController();
  TextEditingController destinationPlaceEditingController =
      TextEditingController();
  FocusNode destinationLocationFocus = FocusNode();
  FocusNode destinationPlaceFocous = FocusNode();

  List<MarsDestinationsModel> locationList = [
    MarsDestinationsModel(
        destinationLocation: 'Monte Olimpo',
        destinationKilometers: '25 quilômetros'),
    MarsDestinationsModel(
        destinationLocation: 'Vulcões Tharsis',
        destinationKilometers: '5 quilômetros'),
    MarsDestinationsModel(
        destinationLocation: 'Valles Marineris',
        destinationKilometers: '10 quilômetros'),
  ];

  Future<void> _showDialog(
    String destinationLocation,
    String destinationKilometers,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext conext) {
        return AlertDialog(
          title: Text(destinationLocation),
          content: SingleChildScrollView(
            child: Container(
              child: Text(
                'KM: $destinationKilometers',
              ),
            ),
          ),
          actions: <Widget>[TextButton(onPressed: () {}, child: Text('ok'))],
        );
      },
    );
  }

  addNewDestination({
    required String destinationLocation,
    required String destinationKilometers,
  }) {
    setState(
      () {
        locationList.insert(
          0,
          MarsDestinationsModel(
            destinationLocation: destinationLocation,
            destinationKilometers: destinationKilometers,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StandardPage(
      pageTile: 'Locais a visitar',
      body: SingleChildScrollView(
        child: Column(
          children: [
            StandardText(
              label:
                  'Incira os principais locais que gostaria de visitar em Marte',
            ),
            const SizedBox(
              height: 25,
            ),
            StandardTextForm(
              label: handlerLocation,
              focusNode: destinationLocationFocus,
              userInputController: destinationLocationEditingController,
              onEditingComplete: () {
                destinationPlaceFocous.nextFocus();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            StandardTextForm(
              label: handlerKilometers,
              userInputController: destinationPlaceEditingController,
              focusNode: destinationPlaceFocous,
            ),
            const SizedBox(
              height: 30,
            ),
            StandardButton(
              buttonText: handlerSubmit3,
              onPressed: () {
                addNewDestination(
                    destinationLocation:
                        destinationLocationEditingController.text,
                    destinationKilometers:
                        destinationPlaceEditingController.text);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: locationList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
              itemBuilder: (context, index) {
                var transactionItems = locationList[index];
                return MouseRegion(
                  cursor: SystemMouseCursors.cell,
                  child: GestureDetector(
                    onTap: () {
                      _showDialog(
                        transactionItems.destinationLocation,
                        transactionItems.destinationKilometers,
                      );
                      print(transactionItems.destinationLocation);
                      print(transactionItems.destinationKilometers);
                    },
                    child: StandardCardContent(
                      leftText: transactionItems.destinationLocation,
                      rightText: transactionItems.destinationKilometers,
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
