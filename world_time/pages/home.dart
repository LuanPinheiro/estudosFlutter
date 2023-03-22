import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        minimum: EdgeInsets.all(50),
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
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
      ),
    );
  }
}
