import 'package:flutter/material.dart';
import 'quote.dart';

class CardTemplate extends StatelessWidget {

  final Quote quote;
  final Function() delete;

  const CardTemplate({
    required this.quote,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.texto,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              quote.autor,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            FilledButton.icon(
              icon: Icon(Icons.delete),
              onPressed: this.delete,
              label: Text("Deletar"),
            ),
          ],
        ),
      ),
    );
  }
}