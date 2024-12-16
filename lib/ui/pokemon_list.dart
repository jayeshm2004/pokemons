import 'dart:convert';

import 'package:pokemons/ui/Pokemon_details_page.dart';

import 'package:pokemons/ui/poke_card.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final ScrollController _scrollController = ScrollController();
  

  late Future<Map<String, dynamic>> individual;

  Future<Map<String, dynamic>> getPokemons() async {
    try {
      final pokemon = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));

      final data = jsonDecode(pokemon.body);

      return data;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    individual = getPokemons();
    
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style:
              TextStyle(fontSize: 40, color: Color.fromARGB(255, 224, 224, 31)),
        ),
        backgroundColor: const Color.fromARGB(255, 117, 70, 125),
      ),
      body: FutureBuilder(
        future: individual,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;

          final currentPokemon = data['pokemon'];
          return Column(
            children: [
              ScrollToHide(
                scrollController: _scrollController,
                hideDirection: Axis.vertical,
                duration: const Duration(microseconds: 300),
                child: const SearchBar(
                  hintText: "Search Pokemon",
                ),
              ),
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  itemCount: 151,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    
                    final display = currentPokemon[index];
                    final imagedata = display['img'];
                    final height=display['height'];
                    final typeData=display['type'];
                    final weaknessData=display['weaknesses'];
                    final weight=display['weight'];
                    final  evolution;
                    final pokeName=display['name'];
                    final evolutionImage=display;
                    if(display['next_evolution']!=null){
                        evolution=display['next_evolution'];

                    }else{
                        evolution=[];
                      
                    }
                    
                    final info=[
                      display,imagedata,height,weight,typeData,weaknessData,evolution,evolutionImage,pokeName
                    ];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PokemonDetailsPage(),
                                      settings: RouteSettings(
                                        arguments: info,
                                        
                                      )));

                        },
                        child: PokeCard(
                          image: imagedata,
                          displayName: display,
                          i: display['num'],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
