
class EditingModelClass {
  String? detail;
  Course? course;

  EditingModelClass({this.detail, this.course});

  EditingModelClass.fromJson(Map<String, dynamic> json) {
    if(json["detail"] is String) {
      detail = json["detail"];
    }
    if(json["course"] is Map) {
      course = json["course"] == null ? null : Course.fromJson(json["course"]);
    }
  }

  static List<EditingModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map(EditingModelClass.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["detail"] = detail;
    if(course != null) {
      _data["course"] = course?.toJson();
    }
    return _data;
  }

  EditingModelClass copyWith({
    String? detail,
    Course? course,
  }) => EditingModelClass(
    detail: detail ?? this.detail,
    course: course ?? this.course,
  );
}

class Course {
  String? id;
  String? university;
  String? description;
  String? status;
  String? title;
  String? courseCode;
  String? vectorizedData;

  Course({this.id, this.university, this.description, this.status, this.title, this.courseCode, this.vectorizedData});

  Course.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["university"] is String) {
      university = json["university"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["course_code"] is String) {
      courseCode = json["course_code"];
    }
    if(json["vectorized_data"] is String) {
      vectorizedData = json["vectorized_data"];
    }
  }

  static List<Course> fromList(List<Map<String, dynamic>> list) {
    return list.map(Course.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["university"] = university;
    _data["description"] = description;
    _data["status"] = status;
    _data["title"] = title;
    _data["course_code"] = courseCode;
    _data["vectorized_data"] = vectorizedData;
    return _data;
  }

  Course copyWith({
    String? id,
    String? university,
    String? description,
    String? status,
    String? title,
    String? courseCode,
    String? vectorizedData,
  }) => Course(
    id: id ?? this.id,
    university: university ?? this.university,
    description: description ?? this.description,
    status: status ?? this.status,
    title: title ?? this.title,
    courseCode: courseCode ?? this.courseCode,
    vectorizedData: vectorizedData ?? this.vectorizedData,
  );
}