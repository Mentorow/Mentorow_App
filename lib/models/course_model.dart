class Course {
  DateTime createdAt;
  String id;
  String courseName;
  String description;
  String duration;
  int price;
  String courseCurriculum;
  int v;

  Course({
    required this.createdAt,
    required this.id,
    required this.courseName,
    required this.description,
    required this.duration,
    required this.price,
    required this.courseCurriculum,
    required this.v,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["_id"],
        courseName: json["courseName"],
        description: json["description"],
        duration: json["duration"],
        price: json["price"],
        courseCurriculum: json["courseCurriculum"],
        v: json["__v"],
      );
}
