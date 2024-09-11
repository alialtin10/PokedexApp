import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constents/constants.dart';
import 'package:pokedexapp/constents/ui_helper.dart';
import 'package:pokedexapp/model/pokedexModel.dart';

class PokeInformation extends StatelessWidget {
  final PokedexModel pokemonModel;
  const PokeInformation({super.key , required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white
      ),
      child: Padding(
        padding: UIHelper.getdefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInformationRow("Name", pokemonModel.name),
            _buildInformationRow("Height", pokemonModel.height),
            _buildInformationRow("Weight", pokemonModel.weight),
            _buildInformationRow("Spawn Time", pokemonModel.spawnTime),
            _buildInformationRow("Weakness", pokemonModel.weaknesses),
            _buildInformationRow("Pre Evolotion", pokemonModel.prevEvolution),
            _buildInformationRow("Next Evolotion", pokemonModel.nextEvolution)  
          ],
        ),
      ),

    );
  }
}


_buildInformationRow(String label , dynamic value){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label , style: Constants.getPokeInfoLabelTextStyle(),),
      if(value is List && value.isNotEmpty)
      Text(value.join(" , "),style: Constants.getPokeInformationTextStyle(),)
      else if(value == null)
      Text("Not avaliable",style: Constants.getPokeInformationTextStyle(),)
      else Text(value.toString(),style: Constants.getPokeInformationTextStyle(),),
    ]
  );
}