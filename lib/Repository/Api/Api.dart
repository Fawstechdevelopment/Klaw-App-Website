
import 'dart:convert';

import 'package:http/http.dart';

import '../ModelClass/AdminLoginModelClass.dart';
import 'Api_client.dart';

class AdminApi {
  ApiClient apiClient = ApiClient();
//Login
  Future<AdminLoginModel> getLoginUser(
      String username, String password) async {
    String trendingpath = 'https://eeae-2405-201-f011-f03c-9def-a1e4-bcb5-6a40.ngrok-free.app/flawsapp/admin_auth/login/';

    var body = {
      "username":username,
      "password":password


    };
    print("welcome" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return AdminLoginModel.fromJson(jsonDecode(response.body));
  }
}