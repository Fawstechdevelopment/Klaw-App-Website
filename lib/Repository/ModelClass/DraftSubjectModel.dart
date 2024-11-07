
class DraftSubjectModel {
  List<Draft>? draft;

  DraftSubjectModel({this.draft});

  DraftSubjectModel.fromJson(Map<String, dynamic> json) {
    if(json["draft"] is List) {
      draft = json["draft"] == null ? null : (json["draft"] as List).map((e) => Draft.fromJson(e)).toList();
    }
  }

  static List<DraftSubjectModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DraftSubjectModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(draft != null) {
      _data["draft"] = draft?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  DraftSubjectModel copyWith({
    List<Draft>? draft,
  }) => DraftSubjectModel(
    draft: draft ?? this.draft,
  );
}

class Draft {
  String? objectId;
  String? title;
  String? courseCode;
  String? university;
  String? description;
  String? file;
  String? status;

  Draft({this.objectId, this.title, this.courseCode, this.university, this.description, this.file, this.status});

  Draft.fromJson(Map<String, dynamic> json) {
    if(json["object_id"] is String) {
      objectId = json["object_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["course_code"] is String) {
      courseCode = json["course_code"];
    }
    if(json["university"] is String) {
      university = json["university"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["file"] is String) {
      file = json["file"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
  }

  static List<Draft> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Draft.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["object_id"] = objectId;
    _data["title"] = title;
    _data["course_code"] = courseCode;
    _data["university"] = university;
    _data["description"] = description;
    _data["file"] = file;
    _data["status"] = status;
    return _data;
  }

  Draft copyWith({
    String? objectId,
    String? title,
    String? courseCode,
    String? university,
    String? description,
    String? file,
    String? status,
  }) => Draft(
    objectId: objectId ?? this.objectId,
    title: title ?? this.title,
    courseCode: courseCode ?? this.courseCode,
    university: university ?? this.university,
    description: description ?? this.description,
    file: file ?? this.file,
    status: status ?? this.status,
  );
}