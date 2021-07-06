import "package:flutter/material.dart";

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonBar(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all(Colors.amber)),
            child: Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
