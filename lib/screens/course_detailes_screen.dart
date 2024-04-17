import 'package:ac_material_app/models/course_model.dart';
import 'package:ac_material_app/repositories/fetch_course.dart';
import 'package:ac_material_app/widgets/drive_link_widget.dart';
import 'package:ac_material_app/widgets/pdf_link_widget.dart';
import 'package:ac_material_app/widgets/youtube_link_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailesScreen extends StatelessWidget {
  final CourseModel course;

  const CourseDetailesScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
                    child: Text(course.courseName,
                        style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
               SizedBox(
                height: 20.h,

              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text("Play List : "),
                        YoutubeLinkWidget(youtubeUrl: course.playlist),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Play List2 : "),
                        YoutubeLinkWidget(youtubeUrl: course.playlist2!),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Drive : "),
                        DriveLinkWidget(
                          DriveUrl: course.drive,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: course.weeks.length,
                  itemBuilder: (context, index) {
                    final week = course.weeks[index];
                    return ExpansionTile(
                      title: Text(
                        week.weekName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      children: week.resources.map((resource) {
                        return Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:12.w ,vertical: 12.h),
                              child: Text(
                                resource.text,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                              ),
                            ),
                            PdfLinkWidget(PdfUrl: resource.link)
                          ],
                        );
                      }).toList(),
                      backgroundColor: Colors.white,
                    );
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
