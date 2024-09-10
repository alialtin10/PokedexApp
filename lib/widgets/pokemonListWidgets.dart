import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/model/pokedexModel.dart';
import 'package:pokedexapp/service/pocedex_api.dart';
import 'package:pokedexapp/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PokemonList> {
  late Future<List<PokedexModel>> _pokemonListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pokemonListFuture = PokeApi.getPokemomnData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokedexModel>>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokedexModel> _listem = snapshot.data!;

            return GridView.builder(
              itemCount: _listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: (context, index) {
                  return PokelistItem(pokemon: _listem[index]);
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Hata cikti"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

/*ListView.builder(
              itemCount: _listem.length,
              itemBuilder: (context, index) {
                var oankipokemon = _listem[index];
                return PokelistItem(pokemon: oankipokemon);
              },
            );*/