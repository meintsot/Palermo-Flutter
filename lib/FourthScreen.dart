import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class GameStart extends StatefulWidget {
  final List<String> names;
  final List<String> roles;
  final int numberOfPlayers;
  final List<int> numberOfVotes;
  GameStart(this.names, this.roles, this.numberOfPlayers, this.numberOfVotes);
  @override
  _GameStartState createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
  List<Container> getPlayers() {
    return widget.names
        .asMap()
        .entries
        .map((entry) => Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.grey[400],
                ),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.numberOfVotes[entry.key].toString(),
                      style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: getPlayers(),
          ),
        ),
      ),
    );
  }
}
