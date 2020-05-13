import "dart:convert";

Lecture lectureFromJson(String str) => Lecture.fromJson(json.decode(str));

String lectureToJson(Lecture data) => json.encode(data.toJson());

class Lecture {
  int id;
  String host_university;
  String host_department;
  String host_major;
  String host_lecture_id;
  String host_lecture_name;
  String eras_university;
  String eras_department;
  String eras_major;
  String eras_lecture_id;
  String eras_lecture_name;
  String year;
  String semester;

  Lecture(
      {this.id,
      this.host_university,
      this.host_department,
      this.host_major,
      this.host_lecture_id,
      this.host_lecture_name,
      this.eras_university,
      this.eras_department,
      this.eras_major,
      this.eras_lecture_id,
      this.eras_lecture_name,
      this.year,
      this.semester});

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        host_university: json["host_university"],
        host_department: json["host_department"],
        host_major: json["host_major"],
        host_lecture_id: json["host_lecture_id"],
        host_lecture_name: json["host_lecture_name"],
        eras_university: json["eras_university"],
        eras_department: json["eras_department"],
        eras_major: json["eras_major"],
        eras_lecture_id: json["eras_lecture_id"],
        eras_lecture_name: json["eras_lecture_name"],
        year: json["year"],
        semester: json["semester"],
      );

  Map<String, dynamic> toJson() => {
        "host_university": host_university,
        "host_department": host_department,
        "host_major": host_major,
        "host_lecture_id": host_lecture_id,
        "host_lecture_name": host_lecture_name,
        "eras_university": eras_university,
        "eras_department": eras_department,
        "eras_major": eras_major,
        "eras_lecture_id": eras_lecture_id,
        "eras_lecture_name": eras_lecture_name,
        "year": year,
        "semester": semester
      };
}
