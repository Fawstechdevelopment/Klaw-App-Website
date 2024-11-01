class DraftSubjectModel {
  DraftSubjectModel({
      this.draft,});

  DraftSubjectModel.fromJson(dynamic json) {
    if (json['draft'] != null) {
      draft = [];
      json['draft'].forEach((v) {
        draft?.add(Draft.fromJson(v));
      });
    }
  }
  List<Draft>? draft;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (draft != null) {
      map['draft'] = draft?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Draft {
  Draft({
      this.title, 
      this.courseCode, 
      this.university, 
      this.description, 
      this.file, 
      this.status,});

  Draft.fromJson(dynamic json) {
    title = json['title'];
    courseCode = json['course_code'];
    university = json['university'];
    description = json['description'];
    file = json['file'];
    status = json['status'];
  }
  String? title;
  String? courseCode;
  String? university;
  String? description;
  dynamic file;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['course_code'] = courseCode;
    map['university'] = university;
    map['description'] = description;
    map['file'] = file;
    map['status'] = status;
    return map;
  }

}