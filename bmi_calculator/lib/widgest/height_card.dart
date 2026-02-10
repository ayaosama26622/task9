import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({
    super.key, required this.height , required this.onChanged
  });
  final int height;
  final Function(double) onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Height",
          style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(height.toString(),
            style: TextStyle( color: AppColors.white , fontSize: 50 , fontWeight: FontWeight.w800 ,),
            ),
            SizedBox(width: 4),
            Text("cm" , style: TextStyle( color: AppColors.white , fontSize: 18),
            ),
        ],
        ),
        Slider(value: height.toDouble(), min: 0 , max:220 ,
        activeColor: AppColors.primarycolor,
        inactiveColor: AppColors.grayColor,
        onChanged: onChanged,
        ),
      ],
    ),
    )
    );
  }
}

