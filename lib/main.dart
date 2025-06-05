import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SmartPharmacistApp());
}

class SmartPharmacistApp extends StatelessWidget {
  const SmartPharmacistApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Pharmacist',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}
