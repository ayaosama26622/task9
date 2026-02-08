import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/page/result_screen.dart';
import 'package:bmi_calculator/widgets/height_card.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:bmi_calculator/widgets/counter_card.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}
class _BmiScreenState extends State<BmiScreen> {
  int weight = 60;
  int age = 22;
  int height = 170;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0c21),
      appBar: AppBar(
      backgroundColor: AppColors.backgroundColor ,
      centerTitle: true,
      title: Text("BMI CALCULATOR" , style: TextStyle(color: AppColors.white, fontSize: 20 , fontWeight: FontWeight.bold ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            GenderSelection(),
            HeightCard(
              height : height,
              onChanged: (value){
                setState(() {
                  height = value.toInt();
                });
              }
            ),
            Expanded(child: Row(
            spacing: 16,
            children: [
              counter(text : "Weight" , count : weight ,
                onRemove: () {
                if ( weight > 0)
                  setState(() {
                    weight --;
                });
                }, 
                onAdd: () {
                setState(() {
                  weight ++;
                });              },
                ),
              counter( text : "Age" , count : age ,
                onRemove: () {
                if ( age > 0)
                setState(() {
                    age --;
                });
                },
                onAdd: () {
                  setState(() {
                    age++;
                  });
                },
                ),
                ],
                ),
            ),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primarycolor,
              minimumSize: Size(double.infinity,50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            onPressed: () {
              double result = weight / (height*height / 10000);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultScreen( result: result) )
              );
            }, 
            child: Text(" Calculate" , 
            style: TextStyle(fontSize: 18 , color: AppColors.white, fontWeight: FontWeight.bold),
            ),
            ),
          ],
          ),
      ),
    );
    
  }

    Expanded GenderSelection() {
    return Expanded(child: Row(
            spacing: 16,
            children: [
              card( 
                isSelected: isMale,
                icon: Icons.male , text:"male" ,
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },),
              card( 
                isSelected: !isMale,
                icon : Icons.female , text: "female",
                onTap: () {
                  setState(() {
                    isMale =false;
                  });
                })]),
            );
  }
}
