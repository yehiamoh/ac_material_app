
import 'package:flutter/material.dart';

class CourseInterfaceWidget extends StatelessWidget {
  final String? courseName;
  const CourseInterfaceWidget({super.key,required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        "assets/images/course-img.png",
        width: 200,
        height: 90,
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(courseName!,style: TextStyle(
            color:Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w700
          ),),
        ],

      ),
      SizedBox(height: 50,),
    ]);
  }
}
