import 'package:flutter/material.dart';
import 'package:gs_app/app/components/BackButton.dart';
import 'package:gs_app/app/modules/Home/index.dart';
import 'package:gs_app/theme/AlternativeTheme.dart';
import 'package:gs_app/utils/export.dart';

class StandardPage extends StatelessWidget {
  final Widget body;
  final String pageTile;

  StandardPage({required this.body, required this.pageTile});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(148),
        child: AppBar(
          backgroundColor: Color.fromARGB(200, 50, 87, 135),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: BackIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 54,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFFFFB84D),
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Home()),
                  ),
                );
              },
            ),
          ),
          flexibleSpace: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              pageTile,
              textAlign: TextAlign.center,
              style: AlternativeTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                  ),
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: SingleChildScrollView(
            child: body,
          )),
    );
  }
}
