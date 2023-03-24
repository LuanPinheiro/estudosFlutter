import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:estudos/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List locations = [];

  // Ao clicar no país que quer alterar, envia de volta para a home com os dados alterados
  void updateTime(index, dados) async{
    WorldTime selecionado = dados[index];
    await selecionado.getTime();

    // Retorna para home
    Navigator.pop(context, {
      'location': selecionado.location,
      'flag': selecionado.flag,
      'time': selecionado.time,
      'isDayTime': selecionado.isDayTime,
    });
  }

  Widget loadTimes() {
    return FutureBuilder(
      future: getDadosApi(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> dados) {
        if(dados.hasData){
          return escolherLista(dados.data);
        }

        return const Center(
          child: SpinKitRing(
            color: Colors.green,
            size: 60,
          ),
        );
      },
    );
  }

  Widget escolherLista(dados){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          updateTime(index, dados);
                        },
                        title: Text(dados[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/placeholder.png"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text("Escolha a Localização"),
        centerTitle: true,
        elevation: 0,
      ),
      body: loadTimes(),
    );
  }
}
