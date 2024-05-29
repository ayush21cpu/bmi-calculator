import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp( const BMICalculator());
}
class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        buttonTheme: const ButtonThemeData(

          buttonColor:Color(0xFF24263B),
        ),
        primaryColor:const Color(0xFF0A0E21),
        scaffoldBackgroundColor:const Color(0xFF0A0E21),
      ),
     debugShowCheckedModeBanner: false,
      home:  const InputPage(),
    );
  }
}
