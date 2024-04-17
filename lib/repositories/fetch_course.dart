import 'dart:convert';
import 'package:ac_material_app/models/course_model.dart';
import 'package:dio/dio.dart';

class FetchCourses {
 Dio dio = Dio();

 Future<List<CourseModel>> getResponse() async {
  try {
   final response = await dio.get('https://raw.githubusercontent.com/ZAHRAN88/ACMaterial/main/assets/data/weeks.json');

   final List<dynamic> parsedData = jsonDecode(response.data);
   return parsedData.map<CourseModel>((json) => CourseModel.fromJson(json)).toList();

  } catch (e) {
   // Handle errors
   print('Error fetching data: $e');
   return [];
  }
 }
 Future<List<Week>> getWeek() async {
  try {
   final response = await dio.get('https://raw.githubusercontent.com/ZAHRAN88/ACMaterial/main/assets/data/weeks.json');

   final List<dynamic> parsedData = jsonDecode(response.data);
   final List<CourseModel> courseModels = parsedData.map<CourseModel>((json) => CourseModel.fromJson(json)).toList();
   // Extracting weeks from
   List<Week> weeks = [];
   courseModels.forEach((course) {
    weeks.addAll(course.weeks);
   });

   return weeks;

  } catch (e) {
   // Handle errors
   print('Error fetching data: $e');
   return [];
  }
 }
 Future<List<Resource>> getResources() async {
  try {
   final response = await dio.get('https://raw.githubusercontent.com/ZAHRAN88/ACMaterial/main/assets/data/weeks.json');

   final List<dynamic> parsedData = jsonDecode(response.data);
   final List<CourseModel> courseModels = parsedData.map<CourseModel>((json) => CourseModel.fromJson(json)).toList();

   // Extracting resources from each Week
   List<Resource> resources = [];
   courseModels.forEach((course) {
    course.weeks.forEach((week) {
     resources.addAll(week.resources);
    });
   });

   return resources;

  } catch (e) {
   // Handle errors
   print('Error fetching data: $e');
   return [];
  }
 }
}
