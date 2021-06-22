import 'dart:convert';
import 'dart:io';
import "package:path_provider/path_provider.dart";
import "package:flutter/material.dart";

class Cadastro extends StatefulWidget {
  const Cadastro();

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController job = TextEditingController();
  TextEditingController salary = TextEditingController();
  String anwser = "";

  Future<File> _saveData() async {
    Map<String, String> cadastro = Map();
    cadastro["job"] = job.text;
    cadastro["salary"] = salary.text;
    job.text = "";
    salary.text = "";
    String data = json.encode(cadastro);
    print(data);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String?> _getData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<Null> _deleteData() async {
    final file = await _getFile();
    file.delete();
  }

  Future<File> _getFile() async {
    final file = await getApplicationDocumentsDirectory();
    print(file.path);
    return File("${file.path}/data.json");
  }

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
        title: Row(
          children: [
            Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
            Text(
              "Cadastro CashFlow!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://iconape.com/wp-content/files/mi/246600/png/246600.png",
              width: 200,
            ),
            _createTextField("Profissão", job, TextInputType.text),
            _createTextField("Salário", salary, TextInputType.number),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (job.text.isEmpty && salary.text.isEmpty) {
                      job.text = "";
                      salary.text = "";
                      anwser = "Digite seus dados.";
                      _deleteData();
                    } else {
                      // Delete the last data used
                      _deleteData();
                      // Save new data
                      _saveData();
                      _getData().then((data) {
                        anwser =
                            "Profissão: ${json.decode(data!)["job"]}\nSalário:${json.decode(data)["salary"]}";
                      });
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
