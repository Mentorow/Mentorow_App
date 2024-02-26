import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mentorow/models/all_mentordetails_model.dart';
import 'package:mentorow/models/course_model.dart';

class Webservice {
  static const mainurl = "https://mentorow.onrender.com/api/";
  List<Course> items = [];
  List<Mentor> mentoritems = [];
  
  Future<List<Course>?> fetchCourses() async {
    try {
      final response = await http.get(Uri.parse("${mainurl}course/AllCourse"));
      log("response == $response");
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('courses')) {
          final jsonArray = jsonResponse['courses'] as List<dynamic>;
          items =
              jsonArray.map((itemJson) => Course.fromJson(itemJson)).toList();
          return items;
        }
      } else {
        throw Exception("Failed to load courses");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Course>?> fetchMentor() async {
    try {
      final response = await http.get(Uri.parse("${mainurl}mentor/Allmentors"));
      log("response == $response");
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('getMentors')) {
          final jsonArray = jsonResponse['getMentors'] as List<dynamic>;
          items =
              jsonArray.map((itemJson) => Course.fromJson(itemJson)).toList();
          return items;
        }
      } else {
        throw Exception("Failed to load courses");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
