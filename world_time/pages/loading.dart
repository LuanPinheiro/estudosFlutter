import 'package:flutter/material.dart';
import 'package:estudos/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime worldInstance = WorldTime(location: "Brasil", flag: "Brasil.png", url: "America/Bahia");
    await worldInstance.getTime();
    // Adicionando delay para visualização da tela de loading
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': worldInstance.location,
        'flag': worldInstance.flag,
        'time': worldInstance.time,
        'isDayTime': worldInstance.isDayTime,
      });
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SpinKitDualRing(
            color: Colors.green,
            size: 60,
          ),
        ),
      ),
    );
  }
}
