import 'package:cashflow/CadastroPage.dart';
import "package:http/http.dart";
import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://iconape.com/wp-content/files/mi/246600/png/246600.png",
          ),
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
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(150))))),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      fixedSize:
                          MaterialStateProperty.all(Size.fromWidth(150))),
                  onPressed: () {},
                  child: Text("Continuar jogo"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
