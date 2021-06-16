import "package:flutter/material.dart";
import "dart:convert";
import "dart:io";
import "dart:async";
import "package:path_provider/path_provider.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController job = TextEditingController();
  TextEditingController salary = TextEditingController();
  String anwser = "";

  Widget _createTextField(
      String label, TextEditingController controller, TextInputType type) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 2, right: 2),
        child: TextField(
            keyboardType: type,
            scrollPadding: EdgeInsets.all(10),
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: label)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Cadastro CashFlow!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _createTextField("Profissão", job, TextInputType.text),
            _createTextField("Salário", salary, TextInputType.number),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (job.text.isEmpty || salary.text.isEmpty) {
                      anwser = "Digite seus dados.";
                    } else {
                      anwser =
                          "Profissão: ${job.text}.\nSalário: ${salary.text}";
                    }
                  });
                },
                child: Text("Cadastrar!")),
            IntrinsicWidth(
              child: Container(
                child: Center(
                  child: Text(
                    anwser,
                    style: TextStyle(fontSize: 25, color: Colors.amber),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}
