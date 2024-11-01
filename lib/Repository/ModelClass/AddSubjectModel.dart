
class AddSubjectModel {
  String? message;

  AddSubjectModel({this.message});

  AddSubjectModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  static List<AddSubjectModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AddSubjectModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    return _data;
  }

  AddSubjectModel copyWith({
    String? message,
  }) => AddSubjectModel(
    message: message ?? this.message,
  );
}