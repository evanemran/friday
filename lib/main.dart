import 'package:flutter/material.dart';
import 'package:friday/pages/home_page.dart';
import 'package:friday/styles/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foxy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.mainColor,
      ),
      home: const HomePage(),
    );
  }
}
