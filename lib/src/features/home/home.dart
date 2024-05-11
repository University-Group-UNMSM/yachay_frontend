import 'package:aprendiendoflutter/onecard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Cursos',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Wrap(children: <Widget>[
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
            OneCard(),
          ]),
        )
      ],
    );
  }
}
