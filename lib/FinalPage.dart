import 'dart:core';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class FinalResult extends StatelessWidget {

   const FinalResult({super.key, required this.bmiResult,required this.interpretation, required this.resultText});

  final String bmiResult;
  final String interpretation;
  final String resultText;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

         appBar: AppBar(
           backgroundColor: Theme.of(context).primaryColor,
           title: const Text( "BMI CALCULATOR"),
         ),

      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Expanded(
            child:Container(
              margin:const EdgeInsets.only(top: 15),
          child:const Text("Your Result",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
            ),
          ),
          ),),
          Expanded(
            flex: 7,
            child:
          Container(

            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(5),
            color: activeColor,
          
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    resultText,
                ),
                const SizedBox(height: 30.0),
                Text(
                   bmiResult,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 50), ),
                const SizedBox(height: 30.0),
                Text(
                interpretation,
                textAlign:TextAlign.center,
                ),
              ],
            ),
          
          ),
          ),

          Container(
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(9),
                bottomLeft: Radius.circular(9),
              ),
            ),
            margin: const EdgeInsets.only(top: 15.0),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFEB1555)),
                shape: MaterialStatePropertyAll(LinearBorder.none),
              ),
              child: const Text(
                'RE-CALCULATE',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const InputPage();
                },),);
              },
            ),
          ),
        ],
      ),
      );

  }
}
