import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'getFunctions.dart';

class WorldTime {

  String location; // Nome do local para aparecer na UI
  String? time; // Tempo na localização escolhida
  String flag; // URL para a bandeira do país
  String url; // URL da localização para a API
  bool isDayTime = false; // True ou False caso seja dia ou não

  WorldTime ({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/${this.url}"));
      Map<String, dynamic> data = jsonDecode(response.body);

      // Separando apenas os dados necessários
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      // Variável que diz se o offset de tempo é subtraído ou adicionado
      String somaSubtrai = offset.substring(0,1);
      offset = offset.substring(1,3);


      DateTime horaAtual = DateTime.parse(datetime);
      if(somaSubtrai == '+'){
        horaAtual = horaAtual.add(Duration(hours: int.parse(offset)));
      }
      else{
        horaAtual = horaAtual.subtract(Duration(hours: int.parse(offset)));
      }

      this.time = DateFormat.jm().format(horaAtual);
      this.isDayTime = time!.contains("AM") ? true : false;
    } catch(e) {
      print("Caught error: $e");
      time = "ERROR";
    }
  }
}

// Busca os dados na api e coloca numa lista organizada de acordo com a classe WorldTime
Future<List> getDadosApi() async{
  List dadosRetorno = [];

  Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezones"));
  List dadosApi = jsonDecode(response.body);

  String location;
  String flag;
  String url;

  for(int i = 0; i < dadosApi.length; i++){
    location = getLocation(dadosApi[i]);
    if(location != "NOT"){
      flag = "$location.png";
      url = dadosApi[i].toString();
      dadosRetorno.add(WorldTime(location: location, flag: flag, url: url));
    }
  }

  return dadosRetorno;
}