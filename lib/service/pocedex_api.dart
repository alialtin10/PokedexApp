
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedexapp/model/pokedexModel.dart';

class PokeApi{
  static const String _url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokedexModel>> getPokemomnData() async {
    List<PokedexModel> _list = [];
    
    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)['pokemon'];

    //debugPrint(pokeList['pokemon'].toString());

    if(pokeList is List)
    {
      _list = pokeList.map((e) => PokedexModel.fromJson(e)).toList();
    }
    else{return [];}

    //debugPrint(_list[0].toString());
    
    return _list;
  }
}