import 'package:flutter/material.dart';

class PokeCard extends StatelessWidget {
  final dynamic i;
  final dynamic displayName;
  final dynamic image;
  const PokeCard(
      {super.key,
      required this.i,
      required this.displayName,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 232, 226, 116),
      child: Column(
        children: [
          Text(
            displayName['name'],
            style: const TextStyle(fontSize: 20,color: Colors.black38),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$i',
                  style: const TextStyle(
                      fontSize: 30, color: Colors.black38)),
                
                Expanded(child: Center(child: Image.network(image))),
              ]
            ),
          )
        ],
      ),
    );
  }
}
