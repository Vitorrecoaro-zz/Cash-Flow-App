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
              "https://iconape.com/wp-content/files/mi/246600/png/246600.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Novo jogo"),
                  style: ButtonStyle(alignment: Alignment.center)),
              ElevatedButton(
                onPressed: () {},
                child: Text("Continuar jogo"),
              )
            ],
          )
        ],
      ),
    );
  }
}
