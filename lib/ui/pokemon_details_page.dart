import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(context) {
    final imagesrc = ModalRoute.of(context)!.settings.arguments as List;
    late final length;
    if (imagesrc[6].length != null) {
      length = imagesrc[6].length;
    } else {
      length = 0;
    }

    

    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Pokedex',
          style:
              TextStyle(fontSize: 40, color: Color.fromARGB(255, 224, 224, 31)),
        ),
        backgroundColor: const Color.fromARGB(255, 117, 70, 125),
      ),
      body: Stack(children: [
        ColumnSuper(
          innerDistance: -35.0,
          children: [
            Container(
                color: Colors.white,
                height: 300,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                )),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Color.fromARGB(255, 249, 228, 254),
              ),
              height: 600,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Height",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 110, 49, 121),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 110, 49, 121),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          imagesrc[2],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 154, 107, 163),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          imagesrc[3],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 154, 107, 163),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      "Type",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 110, 49, 121)),
                    ),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 16),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagesrc[4].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(
                              label: Text(imagesrc[4][index]),
                              backgroundColor:
                                  const Color.fromARGB(255, 233, 229, 137),
                            ),
                          );
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      "Weakness",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 110, 49, 121)),
                    ),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 16),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagesrc[5].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(
                              label: Text(imagesrc[5][index]),
                              backgroundColor:
                                  const Color.fromARGB(255, 233, 229, 137),
                            ),
                          );
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      "Evolutions",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 110, 49, 121)),
                    ),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 16),
                    child: length != 0
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: length,
                            itemBuilder: (context, index) {
                              final evoultionData = imagesrc[6][index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Chip(
                                  label: Text(evoultionData['name']),
                                  backgroundColor:
                                      const Color.fromARGB(255, 233, 229, 137),
                                ),
                              );
                            })
                        : const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              "No further evolutions",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 154, 107, 163),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Image.network(
            imagesrc[1] as String,
            scale: .4,
          ),
        ),
        Container(
          alignment: const Alignment(0, -.8),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Opacity(
              opacity: 0.2,
              child: Text(
                imagesrc[8],
                style: const TextStyle(
                    color: Color.fromARGB(255, 154, 107, 163),
                    fontSize: 100,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}