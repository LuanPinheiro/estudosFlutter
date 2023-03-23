import 'package:flutter/material.dart';
import 'package:estudos/pages/home.dart';
import 'package:estudos/pages/loading.dart';
import 'package:estudos/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));

