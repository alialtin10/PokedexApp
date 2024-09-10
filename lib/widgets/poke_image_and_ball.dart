import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedexapp/constents/ui_helper.dart';
import 'package:pokedexapp/model/pokedexModel.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokedexModel pokemon;
  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pngwing.com.png';
    return Stack(
      children: [
        Align(alignment: Alignment.bottomRight,child: Image.asset(pokeballImageUrl , width: UIHelper.calculatePokeImageAndBallSize(),height: UIHelper.calculatePokeImageAndBallSize(),fit: BoxFit.fitHeight,)), 
        Align(
          alignment: Alignment.bottomRight,child: CachedNetworkImage(imageUrl: pokemon.img ?? '' ,
          errorWidget: (context, url, error) => Icon(Icons.ac_unit),
          width: UIHelper.calculatePokeImageAndBallSize(),
          height: UIHelper.calculatePokeImageAndBallSize(),
          fit: BoxFit.fitHeight,
          placeholder: (context, url) => CircularProgressIndicator(
            color: Colors.red,
          ),
          )),
      ],
    );
  }
}