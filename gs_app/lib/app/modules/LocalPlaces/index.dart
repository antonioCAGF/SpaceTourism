import 'package:flutter/material.dart';
import 'package:gs_app/app/components/BackButton.dart';
import 'package:gs_app/app/components/SlideTile.dart';
import 'package:gs_app/app/modules/Home/index.dart';
import 'package:gs_app/theme/AlternativeTheme.dart';

class LocalPlaces extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LocalPlaces({Key? key}) : super(key: key);

  @override
  _LocalPlacesState createState() => _LocalPlacesState();
}

class _LocalPlacesState extends State<LocalPlaces> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  // ignore: prefer_final_fields
  var _listSlide = [
    {'id': 0, 'image': 'assets/images/img1.jpg'},
    {'id': 1, 'image': 'assets/images/img2.jpg'},
    {'id': 2, 'image': 'assets/images/img3.jpg'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Destinos locais',
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _listSlide.length,
                itemBuilder: (_, currentIndex) {
                  bool activePage = currentIndex == _currentPage;
                  return SlideTile(
                    activePage: activePage,
                    image: _listSlide[currentIndex]['image'] as String,
                  );
                },
              ),
            ),
            _buildBullets()
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(i['id'] as int);
                _currentPage = i['id'] as int;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _currentPage == i['id'] ? Colors.red : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
