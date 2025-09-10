import 'package:flutter/material.dart';

class Papandayan extends StatelessWidget {
  const Papandayan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(15)),
          Container(
            width: 362,
            height: 227,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/mountainImage/JawaBaratImage/Papandayan.jpg'),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
