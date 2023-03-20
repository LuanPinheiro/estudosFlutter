import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var corPrincipal = Colors.grey[900];
  var corFundo = Colors.grey[850];
  var corTexto = Colors.grey[500];
  int idade = 76;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
        backgroundColor: corPrincipal,
      ),
      backgroundColor: corFundo,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://th.bing.com/th/id/R.6fe40d043530561f4dd805c2efe4ec2d?rik=CYT6yoiwgEThCw&pid=ImgRaw&r=0"),
                radius: 100,
              ),
            ),
            Divider(
              height: 40,
              color: Colors.grey[600],
            ),
            Text(
              "NOME",
              style: TextStyle(
                color: corTexto,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "David Bowie",
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2.0,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "IDADE",
              style: TextStyle(
                color: corTexto,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "$idade",
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2.0,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  size: 50.0,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  "davidbowie@gmail.com",
                  style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


