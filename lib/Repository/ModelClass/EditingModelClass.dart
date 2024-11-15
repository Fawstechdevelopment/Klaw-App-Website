class EditingModelClass {
  EditingModelClass({
      this.objectId, 
      this.title, 
      this.courseCode, 
      this.university, 
      this.description, 
      this.file, 
      this.status,});

  EditingModelClass.fromJson(dynamic json) {
    objectId = json['object_id'];
    title = json['title'];
    courseCode = json['course_code'];
    university = json['university'];
    description = json['description'];
    file = json['file'];
    status = json['status'];
  }
  String? objectId;
  String? title;
  String? courseCode;
  String? university;
  String? description;
  String? file;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['object_id'] = objectId;
    map['title'] = title;
    map['course_code'] = courseCode;
    map['university'] = university;
    map['description'] = description;
    map['file'] = file;
    map['status'] = status;
    return map;
  }

}