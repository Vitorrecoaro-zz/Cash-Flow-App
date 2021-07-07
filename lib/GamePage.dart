import 'dart:convert';
import 'dart:io';

import "package:flutter/material.dart";
import 'package:path_provider/path_provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // Define qual página será exibida, de acordo com o a barra de navegação do Scaffold
  int _selectedIndex = 0;
  Map data = Map();

  //Muda qual página está sendo selecionada na barra de navegação do Scaffold
  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Recupera o arquivo .json
  Future<File> _getFile() async {
    final file = await getApplicationDocumentsDirectory();
    print(file.path);
    return File("${file.path}/data.json");
  }

  // Recupera os dados do arquivo .json
  Future<String?> _getData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  //Carrega os dados para a variável data
  Future _loadData() async {
    _getData().then((value) {
      setState(() {
        data = json.decode(value!);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    Scaffold Page = Scaffold();
    if (_selectedIndex == 0) {
      Page = Scaffold(
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        data["job"],
                        style: TextStyle(fontSize: 40),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: "Perfil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money), label: "Dívidas"),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber,
            onTap: _changeIndex,
          ));
    } else if (_selectedIndex == 1) {
      Page = Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.attach_money, size: 50),
              Text(
                data["salary"],
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: "Perfil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money), label: "Dívidas"),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber,
            onTap: _changeIndex,
          ));
    }
    return Page;
  }
}
