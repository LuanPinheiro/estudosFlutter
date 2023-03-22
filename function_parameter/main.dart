import 'package:flutter/material.dart';
import 'quote.dart';
import 'card.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quote> quotes = [
    Quote(autor: "Pessoa A", texto: "Frase do autor A"),
    Quote(autor: "Pessoa B", texto: "Frase do autor B"),
    Quote(autor: "Pessoa C", texto: "Frase do autor C"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: quotes.map((quote) => CardTemplate(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          },
        )).toList(),
      )
    );
  }
}


