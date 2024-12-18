
class ToggleModelClass {
  String? status;

  ToggleModelClass({this.status});

  ToggleModelClass.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
  }

  static List<ToggleModelClass> fromList(List<Map<String, dynamic>> list) {
    return list.map(ToggleModelClass.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    return _data;
  }

  ToggleModelClass copyWith({
    String? status,
  }) => ToggleModelClass(
    status: status ?? this.status,
  );
}