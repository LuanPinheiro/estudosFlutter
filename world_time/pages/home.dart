import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? parametros;

  @override
  Widget build(BuildContext context) {
    parametros = ModalRoute.of(context)!.settings.arguments as Map;
    print(parametros);

    String bgImage = parametros!["isDayTime"] ? "day.png" : "night.png";
    Color bgColor = parametros!["isDayTime"] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 120, 50, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/location");
                    },
                    icon: Icon(
                      Icons.edit_location,
                      size: 40.0,
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        parametros!['location'],
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        parametros!['time'],
                        style: TextStyle(
                          fontSize: 60,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
