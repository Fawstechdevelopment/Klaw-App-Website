
class AdminLoginModel {
  String? message;
  String? access;
  String? refresh;

  AdminLoginModel({this.message, this.access, this.refresh});

  AdminLoginModel.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["access"] is String) {
      access = json["access"];
    }
    if(json["refresh"] is String) {
      refresh = json["refresh"];
    }
  }

  static List<AdminLoginModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AdminLoginModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["access"] = access;
    _data["refresh"] = refresh;
    return _data;
  }

  AdminLoginModel copyWith({
    String? message,
    String? access,
    String? refresh,
  }) => AdminLoginModel(
    message: message ?? this.message,
    access: access ?? this.access,
    refresh: refresh ?? this.refresh,
  );
}