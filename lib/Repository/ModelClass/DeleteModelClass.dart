
class DeleteModelClass {
  String? detail;

  DeleteModelClass({this.detail});

  DeleteModelClass.fromJson(Map<String, dynamic> json) {
    if(json["detail"] is String) {
      detail = json["detail"];
    }
  }

  static List<DeleteModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map(DeleteModelClass.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["detail"] = detail;
    return _data;
  }

  DeleteModelClass copyWith({
    String? detail,
  }) => DeleteModelClass(
    detail: detail ?? this.detail,
  );
}