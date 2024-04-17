import 'package:ac_material_app/repositories/fetch_course.dart';
import 'package:ac_material_app/screens/course_detailes_screen.dart';
import 'package:ac_material_app/widgets/course_interface_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: FutureBuilder(
                  future: FetchCourses().getResponse(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No data available'),
                        );
                      }
                      return Column(
                        children: [
                          Text(
                            "AC MATERIAL",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final course = snapshot.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => CourseDetailesScreen(course: course),
                                      ),
                                    );
                                  },
                                  child: CourseInterfaceWidget(
                                    courseName: course.courseName,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('No data available'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
