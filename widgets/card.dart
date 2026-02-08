import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({super.key, 
  required this.text , 
  required this.icon , 
  required this.onTap,
  required this.isSelected,
  });
  

  final String text;
  final IconData icon;
  final Function() onTap;
  final bool isSelected;

  Color getColor(){
    if(isSelected){
      return AppColors.primarycolor;
    }
    else{
      return AppColors.cardColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector (
        onTap: onTap,
        child: Container(
        decoration: BoxDecoration(
          color: getColor() ,
          borderRadius: BorderRadius.circular(10),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon , color: AppColors.white, size:80),
              Text(text , style: TextStyle( color: AppColors.white , fontSize: 18),),
            ],
          ),
            ),
      ),
      );
  }
}