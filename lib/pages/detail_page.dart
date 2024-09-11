import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constents/constants.dart';
import 'package:pokedexapp/constents/ui_helper.dart';
import 'package:pokedexapp/model/pokedexModel.dart';
import 'package:pokedexapp/widgets/poke_information.dart';
import 'package:pokedexapp/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokedexModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait ? _buildPortraidBody(context ) : _buildLandscapeBody(context);
  }

  Scaffold _buildPortraidBody(BuildContext context) {
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
        SizedBox(height: 20.h,),
        Expanded(child: Stack(
          children: [
            Positioned(child: Image.asset(Constants.pokeballImageUrl,height: 0.15.sh, fit: BoxFit.fitHeight,),
            right: 0,
            top: 0,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0.12.sh,
              child: PokeInformation(pokemonModel: pokemon)),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id!,
                child: CachedNetworkImage(imageUrl: pokemon.img ?? '' , height: 0.25.sh, fit: BoxFit.fitHeight,)),
            )
          ],
        ))
      ],
    )),
  );
  }
  
  _buildLandscapeBody(BuildContext context) {
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
          Expanded(child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PokeNameType(pokemon: pokemon),
                    Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(imageUrl: pokemon.img ?? '' ,
                    height: 0.25.sw,
                    fit: BoxFit.fitHeight,)),
                  ],
                ),
              ),
              Expanded(flex: 5,child: Padding(
                padding: UIHelper.getdefaultPadding(),
                child: PokeInformation(pokemonModel: pokemon),
              )),
            ],
          )),
          ],
        ),
      ),
    );
  }
}
