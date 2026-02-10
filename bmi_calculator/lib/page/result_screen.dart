import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key , required this.result});
  final double result;
  Status gatStatus(){
       if (result < 18.5 ){
        return Status( "Underweight" , Colors.blue);
        }
        else if (result <= 24.9){
          return Status("Healthy weight" , Colors.green);
        }
        else if (result <= 29.9){
          return Status("Overweight" , Colors.orange);
        }
        else{
          return Status("Obese" , Colors.red);
        }
       
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text("BMI RESULT" , style: TextStyle(color: AppColors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: AppColors.white, size: 28,),
        leading:
        BackButton(
          onPressed: () {Navigator.pop(context);}
        ),
      ),
      
      body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          SizedBox(height: 40,),
          Row( children: [
              Text("Your result" , style: TextStyle(color: AppColors.white , fontSize: 30 ),
          ),
        ]
          ),
          Expanded(
            child: Center(
              child:Container(
                width: double.infinity,
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column( children: [
                              statusUI(),
                              SizedBox(height: 16,),
                              Text(result.toStringAsFixed(2) , 
                              style: TextStyle( color: AppColors.white , fontSize: 50 , fontWeight: FontWeight.bold)
                              )
                              ],
                          ),
                            
                          ],
                        ),
                ),
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
            onPressed: ()  {}, 
            child: Text(" Racalculate" , 
            style: TextStyle(fontSize: 20 , color: AppColors.white, fontWeight: FontWeight.bold),
            ),
            )
        ]
            )    
      )
            ); 
  }
  Widget statusUI(){
    Status status = gatStatus();
    return Text(
      status.name,
      style: TextStyle(
        fontSize: 35,
        color: status.color,
        fontWeight: FontWeight.bold,

      ),
    );
  }
}
class Status{
  final String name;
  final Color color;
  Status (this.name , this.color);
}