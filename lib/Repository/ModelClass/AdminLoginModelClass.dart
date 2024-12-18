
class AdminLoginModel {
  String? access;
  String? refresh;

  AdminLoginModel({this.access, this.refresh});

  AdminLoginModel.fromJson(Map<String, dynamic> json) {
    if(json["access"] is String) {
      access = json["access"];
    }
    if(json["refresh"] is String) {
      refresh = json["refresh"];
    }
  }

  static List<AdminLoginModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(AdminLoginModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access"] = access;
    _data["refresh"] = refresh;
    return _data;
  }

  AdminLoginModel copyWith({
    String? access,
    String? refresh,
  }) => AdminLoginModel(
    access: access ?? this.access,
    refresh: refresh ?? this.refresh,
  );
}