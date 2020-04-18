import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bill_calculator.dart';

void main(List<String> args)=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Tip Calculator',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BillCalculator(),
    );
  }
}

