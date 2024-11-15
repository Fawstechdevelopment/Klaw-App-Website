
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelClass/AddSubjectModel.dart';
import '../ModelClass/AdminLoginModelClass.dart';
import '../ModelClass/DeleteModelClass.dart';
import '../ModelClass/DraftSubjectModel.dart';
import '../ModelClass/EditingModelClass.dart';
import '../ModelClass/PublishedSubjectModel.dart';
import '../ModelClass/ToggleModelClass.dart';
import 'Api_client.dart';


class AdminApi {
  ApiClient apiClient = ApiClient();

//Login
  Future<AdminLoginModel> getLoginUser(String username, String password) async {
    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/login/';

    var body = {
      "username": username,
      "password": password
    };
    print("welcome" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'LOGINPOST', jsonEncode(body));
    print('hello' + response.body);
    return AdminLoginModel.fromJson(jsonDecode(response.body));
  }

  //Add Subject

  Future<AddSubjectModel> getAddSubject(String title,
      String coursecode,
      String university,
      String description,
      String status,
      List<PlatformFile> selectedFiles,) async {
    print('selectedfile '+selectedFiles.toString());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('token') ?? "";

    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/add-course/';

    // Using multipart request for uploading files
    var request = http.MultipartRequest('POST', Uri.parse(trendingpath));

    // Adding authorization header
    request.headers['Authorization'] = 'Bearer $accessToken';

    // Adding other fields to the request
    request.fields['title'] = title;
    request.fields['course_code'] = coursecode;
    request.fields['university'] = university;
    request.fields['description'] = description;
    request.fields['status'] = status;

    // Adding multiple files to the request
    if (selectedFiles.isNotEmpty) {

      for (var file in selectedFiles) {
        if (kIsWeb) {
          // For web, use bytes
          if (file.bytes != null) {
            request.files.add(http.MultipartFile.fromBytes(
              'file', // This should match the backend's expected field name
              file.bytes!,
              filename: file.name,
            ));
          }
        } else {
          // For mobile platforms, use the file path
          if (file.path != null) {
            request.files.add(await http.MultipartFile.fromPath(
              'file',
              file.path!,
            ));
          }
        }
      }
    }

    // Sending the request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Parsing the response body to AddSubjectModel
      return AddSubjectModel.fromJson(jsonDecode(response.body));
    } else {
      // Handle errors accordingly
      throw Exception('Failed to update profile: ${response.body}');
    }
  }

//Published Subjects
  Future<PublishedSubjectModel> getPublishedSubject() async {
    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/courses/published/';

    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', null);

    return PublishedSubjectModel.fromJson(jsonDecode(response.body));
  }
//Draft
  Future<DraftSubjectModel> getDraftSubject() async {
    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/courses/draft/';

    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', null);

    return DraftSubjectModel.fromJson(jsonDecode(response.body));
  }

  //Delete

  Future<DeleteModelClass> getDeleteSubject( String SubjectId ) async {
    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/delete-course/$SubjectId/';

    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'DELETE', null);

    return DeleteModelClass.fromJson(jsonDecode(response.body));
  }
//Toggle Api Publish to draft & draft to publish
  Future<ToggleModelClass> getToggleSubject( String SubjectId ) async {
    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/api/toggle-course-status/$SubjectId/';

    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', null);

    return ToggleModelClass.fromJson(jsonDecode(response.body));
  }


//  Editing Api

  Future<EditingModelClass> getEditSubject(String title,
      String coursecode,
      String university,
      String description,
      String status,
      List<PlatformFile> selectedFiles,
      String SubjectId
      ) async {
    print('selectedfile '+selectedFiles.toString());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('token') ?? "";

    String trendingpath = 'https://flawsapp.onrender.com/flawsproject/adminside/update-course/$SubjectId/';

    // Using multipart request for uploading files
    var request = http.MultipartRequest('PATCH', Uri.parse(trendingpath));

    // Adding authorization header
    request.headers['Authorization'] = 'Bearer $accessToken';

    // Adding other fields to the request
    request.fields['title'] = title;
    request.fields['course_code'] = coursecode;
    request.fields['university'] = university;
    request.fields['description'] = description;
    request.fields['status'] = status;


    // Adding multiple files to the request
    if (selectedFiles.isNotEmpty) {

      for (var file in selectedFiles) {
        if (kIsWeb) {
          // For web, use bytes
          if (file.bytes != null) {
            request.files.add(http.MultipartFile.fromBytes(
              'file', // This should match the backend's expected field name
              file.bytes!,
              filename: file.name,
            ));
          }
        } else {
          // For mobile platforms, use the file path
          if (file.path != null) {
            request.files.add(await http.MultipartFile.fromPath(
              'file',
              file.path!,
            ));
          }
        }
      }
    }

    // Sending the request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Parsing the response body to AddSubjectModel
      return EditingModelClass.fromJson(jsonDecode(response.body));
    } else {
      // Handle errors accordingly
      throw Exception('Failed to update profile: ${response.body}');
    }
  }


}