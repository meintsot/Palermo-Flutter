import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'SlideRightPageRoute.dart';
import 'SlideLeftPageRoute.dart';
import 'SecondScreen.dart';
import 'Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width / 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                size.width * 0.1,
                size.height * 0.05,
                size.width * 0.1,
                0,
              ),
              child: Text(
                "Μια νύχτα... στο",
                style: TextStyle(
                  color: Colors.amber[300],
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.2,
              ),
              child: Text(
                "ΠΑΛΕΡΜΟ",
                style: TextStyle(
                  color: Colors.amber[100],
                  fontSize: size.width / 10,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Container clicked!");
                Navigator.push(
                    context, SlideRightPageRoute(widget: SecondScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(0),
                width: 300,
                height: 300,
                child: SvgPicture.asset(
                  "VectorAssets/start.svg",
                  semanticsLabel: 'Start',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Containter2 clicked!");
                Navigator.push(
                    context, SlideRightPageRoute(widget: Settings()));
              },
              child: Container(
                padding: EdgeInsets.all(30),
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  "VectorAssets/settings.svg",
                  semanticsLabel: 'Settings',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
