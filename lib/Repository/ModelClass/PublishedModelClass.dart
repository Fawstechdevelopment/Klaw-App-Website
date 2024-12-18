class PublishedModelClass {
  PublishedModelClass({
      this.id, 
      this.university, 
      this.description, 
      this.status, 
      this.title, 
      this.courseCode, 
      this.vectorizedData,});

  PublishedModelClass.fromJson(dynamic json) {
    id = json['_id'];
    university = json['university'];
    description = json['description'];
    status = json['status'];
    title = json['title'];
    courseCode = json['course_code'];
    vectorizedData = json['vectorized_data'];
  }
  String? id;
  String? university;
  String? description;
  String? status;
  String? title;
  String? courseCode;
  String? vectorizedData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['university'] = university;
    map['description'] = description;
    map['status'] = status;
    map['title'] = title;
    map['course_code'] = courseCode;
    map['vectorized_data'] = vectorizedData;
    return map;
  }
  static List<PublishedModelClass> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => PublishedModelClass.fromJson(value)).toList();
  }
}