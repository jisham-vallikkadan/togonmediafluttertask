class Categories {
  String name;
  String thumbnail;
  int numberOfCourses;
  String code;


  Categories({
    required this.thumbnail,
    required this.name,
    required this.numberOfCourses,
    required this.code
  });

  factory Categories.fromJson(Map<String, dynamic> responce) => Categories(
        name: responce["name"],
        thumbnail: responce["thumbnail"],
        numberOfCourses: responce["number_of_courses"],
    code: responce['code']
      );
}


