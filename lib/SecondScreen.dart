import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_game/SlideLeftPageRoute.dart';
import 'main.dart';
import 'ThirdScreen.dart';
import 'SlideRightPageRoute.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> finalRoles = [];
  final List<String> roles = [
    'Ρουφιάνος',
    'Καμικάζι',
    'Ερωτευμένοι',
    'Τρέλα',
    'Μητέρα Τερέζα',
    'Δήμαρχος',
    'Αλεξίσφαιρος'
  ];
  List<String> choices = [
    'VectorAssets/btn.svg',
    'VectorAssets/btn.svg',
    'VectorAssets/btn.svg',
    'VectorAssets/btn.svg',
    'VectorAssets/btn.svg',
    'VectorAssets/btn.svg',
    'VectorAssets/btn.svg'
  ];
  List<String> time = [
    '5λ',
    '9λ',
    '∞',
  ];
  int timeChoice = 2;
  int numberOfPlayers = 5;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Container> getRoleChoices() {
      return roles
          .asMap()
          .entries
          .map(
            (role) => Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                  color: Colors.grey[400],
                )),
              ),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      role.value,
                      style: TextStyle(
                        color: Colors.yellow[100],
                        fontSize: 25,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (choices[role.key] == 'VectorAssets/btn.svg') {
                        print('chosen!');
                        if (role.value == 'Ερωτευμένοι') {
                          setState(() {
                            choices[role.key] = 'VectorAssets/btn_active.svg';
                            numberOfPlayers += 2;
                            finalRoles.add(role.value);
                            finalRoles.add(role.value);
                          });
                        } else {
                          setState(() {
                            choices[role.key] = 'VectorAssets/btn_active.svg';
                            numberOfPlayers += 1;
                            finalRoles.add(role.value);
                          });
                        }
                      } else {
                        if (role.value == 'Ερωτευμένοι') {
                          setState(() {
                            choices[role.key] = 'VectorAssets/btn.svg';
                            numberOfPlayers -= 2;
                            finalRoles.remove(role.value);
                            finalRoles.remove(role.value);
                          });
                        } else {
                          setState(() {
                            choices[role.key] = 'VectorAssets/btn.svg';
                            numberOfPlayers -= 1;
                            finalRoles.remove(role.value);
                          });
                        }
                        print('unchosen!');
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(0, 0, 13.0, 0),
                      child: SvgPicture.asset(
                        choices[role.key],
                        semanticsLabel: "button",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "ΕΠΙΛΟΓΕΣ",
                          style: TextStyle(
                            color: Colors.orange[600],
                            fontSize: 30,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Info');
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          child: SvgPicture.asset(
                            'VectorAssets/info.svg',
                            semanticsLabel: 'Info',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Παίχτες",
                            style: TextStyle(
                              color: Colors.yellow[100],
                              fontSize: 25,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('chosen!');
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30.0, 0),
                            child: Text(
                              numberOfPlayers.toString(),
                              style: TextStyle(
                                color: Colors.yellow[100],
                                fontSize: 30,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] +
                getRoleChoices() +
                [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Χρόνος Γύρου",
                            style: TextStyle(
                              color: Colors.yellow[100],
                              fontSize: 25,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeChoice = (timeChoice + 1) % 3;
                            });
                            print("Clicked!");
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 23.0, 0),
                            child: Text(
                              time[timeChoice],
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Back...");
                            Navigator.pop(
                                context, SlideLeftPageRoute(widget: MyApp()));
                          },
                          child: Container(
                            child: SvgPicture.asset(
                              'VectorAssets/larrow.svg',
                            ),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            this.finalRoles += [
                              'Πολίτης',
                              'Πολίτης',
                              'Πολίτης',
                              'Φανερός Δολοφόνος',
                              'Κρυφός Δολοφόνος'
                            ];
                            this.finalRoles.shuffle();
                            print(this.finalRoles);
                            Navigator.push(
                                context,
                                SlideRightPageRoute(
                                    widget: RoleShow(
                                        this.finalRoles,
                                        this.numberOfPlayers,
                                        this.time[this.timeChoice])));
                          },
                          child: Container(
                            child: SvgPicture.asset(
                              'VectorAssets/rarrow.svg',
                            ),
                            width: 60,
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}
