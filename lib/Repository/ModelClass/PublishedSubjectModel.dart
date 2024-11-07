
class PublishedSubjectModel {
  List<Published>? published;

  PublishedSubjectModel({this.published});

  PublishedSubjectModel.fromJson(Map<String, dynamic> json) {
    if(json["published"] is List) {
      published = json["published"] == null ? null : (json["published"] as List).map((e) => Published.fromJson(e)).toList();
    }
  }

  static List<PublishedSubjectModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PublishedSubjectModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(published != null) {
      _data["published"] = published?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  PublishedSubjectModel copyWith({
    List<Published>? published,
  }) => PublishedSubjectModel(
    published: published ?? this.published,
  );
}

class Published {
  String? objectId;
  String? title;
  String? courseCode;
  String? university;
  String? description;
  String? file;
  String? status;

  Published({this.objectId, this.title, this.courseCode, this.university, this.description, this.file, this.status});

  Published.fromJson(Map<String, dynamic> json) {
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

  static List<Published> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Published.fromJson(map)).toList();
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

  Published copyWith({
    String? objectId,
    String? title,
    String? courseCode,
    String? university,
    String? description,
    String? file,
    String? status,
  }) => Published(
    objectId: objectId ?? this.objectId,
    title: title ?? this.title,
    courseCode: courseCode ?? this.courseCode,
    university: university ?? this.university,
    description: description ?? this.description,
    file: file ?? this.file,
    status: status ?? this.status,
  );
}