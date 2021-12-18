import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_game/SlideRightPageRoute.dart';
import 'FourthScreen.dart';

class RoleShow extends StatefulWidget {
  final List<String> currentRoles;
  final int numberOfRoles;
  final String time;
  RoleShow(this.currentRoles, this.numberOfRoles, this.time);
  @override
  _RoleShowState createState() => _RoleShowState();
}

class _RoleShowState extends State<RoleShow> {
  final controller = TextEditingController();
  int currentRoleIndex = 0;
  String currentRole = '';
  String currentRoleAsset = 'VectorAssets/null.svg';
  List<String> names = [];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                ),
                controller: controller,
              ),
            ),
            Container(
              child: SvgPicture.asset(currentRoleAsset),
            ),
            Container(
              child: Text(
                currentRole,
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 40,
                  fontFamily: 'arial',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: SvgPicture.asset('VectorAssets/larrow.svg'),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        currentRole = widget.currentRoles[currentRoleIndex];
                        print(currentRoleIndex);
                        if (currentRole == 'Πολίτης') {
                          currentRoleAsset = 'VectorAssets/civil.svg';
                        } else if (currentRole == 'Φανερός Δολοφόνος') {
                          currentRoleAsset = 'VectorAssets/shown_murderer.svg';
                        } else if (currentRole == 'Κρυφός Δολοφόνος') {
                          currentRoleAsset = 'VectorAssets/hidden_murderer.svg';
                        } else if (currentRole == 'Ρουφιάνος') {
                          currentRoleAsset = 'VectorAssets/pimp.svg';
                        } else if (currentRole == 'Καμικάζι') {
                          currentRoleAsset = 'VectorAssets/kamikaze.svg';
                        } else if (currentRole == 'Ερωτευμένοι') {
                          currentRoleAsset = 'VectorAssets/couple.svg';
                        } else if (currentRole == 'Τρέλα') {
                          currentRoleAsset = 'VectorAssets/fool.svg';
                        } else if (currentRole == 'Μητέρα Τερέζα') {
                          currentRoleAsset = 'VectorAssets/mother_teresa.svg';
                        } else if (currentRole == 'Δήμαρχος') {
                          currentRoleAsset = 'VectorAssets/mayor.svg';
                        } else if (currentRole == 'Αλεξίσφαιρος') {
                          currentRoleAsset = 'VectorAssets/bulletproof.svg';
                        }
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        currentRole = '';
                        currentRoleAsset = 'VectorAssets/null.svg';
                      });
                    },
                    child: Container(
                      child: SvgPicture.asset('VectorAssets/btn.svg'),
                      width: 130,
                      height: 130,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (this.currentRoleIndex == widget.numberOfRoles - 1) {
                        List<int> numberOfVotes =
                            widget.currentRoles.map((e) => 0).toList();
                        Navigator.push(
                            context,
                            SlideRightPageRoute(
                                widget: GameStart(
                                    this.names,
                                    widget.currentRoles,
                                    widget.numberOfRoles,
                                    numberOfVotes)));
                      } else {
                        setState(() {
                          this.names.add(controller.text);
                          controller.text = 'Εισάγετε όνομα';
                          this.currentRoleIndex = this.currentRoleIndex += 1;
                        });
                      }
                    },
                    child: Container(
                      child: SvgPicture.asset('VectorAssets/rarrow.svg'),
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
    );
  }
}
