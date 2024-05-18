import 'package:flutter/material.dart';
import 'package:yachay/src/features/MisCursos/presentation/miscursos-card.dart';

class MisCursosCards extends StatefulWidget {
  const MisCursosCards({
    super.key,
  });

  @override
  State<MisCursosCards> createState() => _MisCursosCardsState();
}

class _MisCursosCardsState extends State<MisCursosCards> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Align(
          alignment: Alignment.topCenter,
          child: Wrap(children: <Widget>[
            MisCursosCard(),
            MisCursosCard(),
            MisCursosCard(),
            MisCursosCard(),
            MisCursosCard(),
          ]),
        )
      ],
    );
  }
}
