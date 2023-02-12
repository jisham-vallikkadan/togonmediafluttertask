import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/categoriesmodel.dart';
import '../../model/topcoursemodel.dart';

class Courseprovider with ChangeNotifier {

  List colorss = [
    Colors.blue[900],
    Colors.red[300],
    Colors.green[300],
  ];
  Random randomcolor = new Random();




  Future<List<Topcourse>> topcourses() async {
    var url = 'https://futursity.com/course/api/top_courses';
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      // print(body);
      List<Topcourse> topcourse =
          List<Topcourse>.from(body.map((v) => Topcourse.fromJson(v))).toList();
      print(topcourse);

      return topcourse;
    } else {
      List<Topcourse> topcourse = [];
      return topcourse;
    }
  }

  Future<List<Categories>> categories() async {
    var url = 'https://futursity.com/course/api/categories';
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      print(body);
      List<Categories> categories =
          List<Categories>.from(body.map((v) => Categories.fromJson(v)))
              .toList();

      return categories;
    } else {
      List<Categories> categories = [];
      return categories;
    }
  }
}
