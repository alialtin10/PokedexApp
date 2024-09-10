import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constents/constants.dart';
import 'package:pokedexapp/constents/ui_helper.dart';
import 'package:pokedexapp/model/pokedexModel.dart';
import 'package:pokedexapp/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokedexModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getIconPadding(),
            child: IconButton(
                iconSize: 24.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          PokeNameType(pokemon: pokemon),
        ],
      )),
    );
  }
}
