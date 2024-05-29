import 'package:bmi_calculator/FinalPage.dart';
import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/widget/custom_btn.dart';
import 'package:bmi_calculator/widget/txt_style.dart';
import 'package:flutter/material.dart';

const enActiveColor = Color(0xEE111328);
const activeColor = Color(0xFF24263B);


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;
  int height= 160;
  int weights=50;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "BMI CALCULATOR",
        ),
      ),
      body:SafeArea(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// for upper two buttons Male and Female
          Row(
            children: <Widget>[
              //male
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        selectedGender = Gender
                            .male; //yaha hame enums class use kiya hai yaha ham 0 or 1 me bhi kr sakte the but vo bad me confusing hota
                      },
                    );
                  },
                  child: ButtonsStyle(
                    btnName: 'MALE',
                    icon: const Icon(
                      Icons.male,
                      color: Colors.white,
                      size: 85,
                    ),
                    bgColor: selectedGender == Gender.male
                        ? activeColor
                        : enActiveColor,
                    textStyle: bTxtStyle(),
                  ),
                ),
              ),
              //female
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ButtonsStyle(
                    btnName: 'FEMALE',
                    icon: const Icon(
                      Icons.female,
                      color: Colors.white,
                      size: 85,
                    ),
                    bgColor: selectedGender == Gender.female
                        ? activeColor
                        : enActiveColor,
                    textStyle: bTxtStyle(),
                  ),
                ),
              ),
            ],
          ),

          ///mid button for height section
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: bTxtStyle(),
                  ),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                       Text(
                        height.toString(),
                        style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                      ),
                      Text("cm",style: bTxtStyle().copyWith(fontSize: 34),),
                    ],
                  ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor:Colors.white,
                      inactiveTrackColor: const Color(0xFF8d8e98),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: const Color(0xFFEB1555),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: const Color(0x29EB1555),
                    ),

                  child: Slider(
                    value:  height.toDouble(),
                    min: 120,
                    max: 220,
                    //divisions: 1,
                    //label: currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        height =value.round();
                      });
                    }
                ),
                ),
                ],
              ),
            ),
          ),

          ///for lower two buttons
          Row(
            children: <Widget>[
              //weight
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(5),
                  // width: 200,
                  // height: 200,
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color:activeColor,
                  ),
                  child: Column(
                    children: [
                      Text("WEIGHT",style: bTxtStyle(),),
                      Text(
                        weights.toString(),
                        style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                      //button for decrement
                      FloatingActionButton(
                        heroTag: 'btn1',
                        backgroundColor: const Color(0xFF4c4f5e),
                        child:const Icon(Icons.remove),
                        onPressed: (){
                          setState(() {
                            weights--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      //for decrement
                      FloatingActionButton(
                        heroTag: 'btn2',
                        backgroundColor: const Color(0xFF4c4f5e),
                        child:const Icon(Icons.add),
                        onPressed: (){
                          setState(() {
                            weights++;
                          });
                        },
                      ),
                      ],
                      ),
                    ],
                  ),
                ),
              ),

              //age
              Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(5),
                    // width: 200,
                    // height: 170,
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color:activeColor,
                    ),
                    child: Column(
                      children: [
                        Text("AGE",style: bTxtStyle(),),
                        Text(
                          age.toString(),
                          style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            //button for decrement
                            FloatingActionButton(
                              heroTag: 'btn9',
                              backgroundColor: const Color(0xFF4c4f5e),
                              child:const Icon(Icons.remove),
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            //for increment
                            FloatingActionButton(
                              heroTag: 'btn8',
                              backgroundColor: const Color(0xFF4c4f5e),
                              child:const Icon(Icons.add),
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
              ),
            ],
          ),

          ///for submit button
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
                'CALCULATE',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            
              onPressed: () {
                CalculateBrain cb=CalculateBrain(height: height, weight: weights);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                   FinalResult(
                    bmiResult: cb.bmiCalculate(),
                    interpretation: cb.getInterpretation(),
                    resultText: cb.getResult(),
                  ),
                ),);
              },
            ),
          ),
        ],
      ),
      ),
    );
  }
}

enum Gender { male, female }
