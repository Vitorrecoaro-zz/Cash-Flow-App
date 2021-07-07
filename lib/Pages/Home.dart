import 'package:cashflow/Pages/CadastroPage.dart';
import "package:flutter/material.dart";

import 'GamePage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/CashFlow_logo.png", height: 350),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cadastro()));
                        },
                        child: Text("Novo jogo"),
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            fixedSize: MaterialStateProperty.all(
                                Size.fromWidth(150))))),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        fixedSize:
                            MaterialStateProperty.all(Size.fromWidth(150))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GamePage()));
                    },
                    child: Text("Continuar jogo"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
