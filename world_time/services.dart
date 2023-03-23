import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Nome do local para aparecer na UI
  String? time; // Tempo na localização escolhida
  String flag; // URL para a bandeira do país
  String url; // URL da localização para a API
  bool? isDayTime; // True ou False caso seja dia ou não

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
      time = "Could not get time data";
    }
  }
}