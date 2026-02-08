import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class counter extends StatelessWidget {
  const counter({super.key,
    required this.text , 
    required this.count,
    required this.onRemove, 
    required this.onAdd ,
   
   });
  final String text;
  final int count;
  final Function() onRemove;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text , style: TextStyle( color: AppColors.white , fontSize: 18),),
            Text(count.toString() , style: TextStyle( color: AppColors.white , fontSize: 40 , fontWeight: FontWeight.w800),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.grayColor
                  ),
                  onPressed: onRemove , icon: Icon(Icons.remove , color: AppColors.white)
                  ),
                  IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.grayColor
                  ),
                  onPressed: onAdd , icon: Icon(Icons.add , color: AppColors.white)
                  ),

              ],
            )
          ],
        ),
    ));
  }
}