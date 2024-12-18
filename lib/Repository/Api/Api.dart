
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelClass/AddSubjectModel.dart';
import '../ModelClass/AdminLoginModelClass.dart';
import '../ModelClass/ContactModel.dart';
import '../ModelClass/DeleteModelClass.dart';
import '../ModelClass/DraftSubjectModel.dart';
import '../ModelClass/EditingModelClass.dart';
import '../ModelClass/PublishedModelClass.dart';
import '../ModelClass/ToggleModelClass.dart';
import 'Api_client.dart';


class AdminApi {
  ApiClient apiClient = ApiClient();

//Login
  Future<AdminLoginModel> getLoginUser(String username, String password) async {
    String trendingpath = 'http://16.170.140.123:8000/api/admin/login/';

    var body =
    {
      "username": username,
      "password": password
    };
    print("welcome" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'LOGINPOST', jsonEncode(body));
    return AdminLoginModel.fromJson(jsonDecode(response.body));
  }

  //  Contact api
  Future<ContactModel> getContact(String name,String Email,String Phonenumber,String Feedback ) async {
    String trendingpath = 'http://16.170.140.123:8000/api/admin/contact/';
    var body = {
      "name": name,
      "email": Email,
      "phone":Phonenumber,
      "how_did_you_find_us": Feedback
    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));
    return ContactModel .fromJson(jsonDecode(response.body));
  }

  // Showing Published subject

  Future<List<PublishedModelClass>> getPublishSubjectList() async {
    String trendingpath =
        'http://16.170.140.123:8000/api/admin/course-list/?status=published';
    var body = {};

    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return PublishedModelClass.listFromJson(jsonDecode(response.body));
  }


  //Delete

  Future<DeleteModelClass> getDeleteSubject( String SubjectId ) async {
    String trendingpath = 'http://16.170.140.123:8000/api/admin/toggle-status/$SubjectId/';

    var body = {
      "delete": true
    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return DeleteModelClass.fromJson(jsonDecode(response.body));
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

    String trendingpath = 'http://16.170.140.123:8000/api/admin/add-course/';

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

//Draft
  Future<List<DraftSubjectModel>> getDraftSubject() async {
    String trendingpath =
        'http://16.170.140.123:8000/api/admin/course-list/?status=draft';
    var body = {};

    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return DraftSubjectModel.listFromJson(jsonDecode(response.body));
  }







//Toggle Api Publish to draft & draft to publish
  Future<ToggleModelClass> getToggleSubject( String SubjectId ) async {
    String trendingpath = 'http://16.170.140.123:8000/api/admin/toggle-status/$SubjectId/';

    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return ToggleModelClass.fromJson(jsonDecode(response.body));
  }


//  Editing Api

  Future<EditingModelClass> getEditSubject(String title,
   //   String coursecode,
      String university,
      String description,
      // String status,
      List<PlatformFile> selectedFiles,
      String SubjectId
      ) async {
    print('selectedfile '+selectedFiles.toString());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('token') ?? "";

    String trendingpath = 'http://16.170.140.123:8000/api/admin/edit-course/$SubjectId/';

    // Using multipart request for uploading files
    var request = http.MultipartRequest('PATCH', Uri.parse(trendingpath));

    // Adding authorization header
    request.headers['Authorization'] = 'Bearer $accessToken';

    // Adding other fields to the request
    request.fields['title'] = title;
   // request.fields['course_code'] = coursecode;
    request.fields['university'] = university;
    request.fields['description'] = description;
    // request.fields['status'] = status;


    // Adding multiple files to the request
    if (selectedFiles.isNotEmpty) {

      for (var file in selectedFiles) {
        if (kIsWeb) {
          // For web, use bytes
          if (file.bytes != null) {
            request.files.add(http.MultipartFile.fromBytes(
              'file_input', // This should match the backend's expected field name
              file.bytes!,
              filename: file.name,
            ));
          }
        } else {
          // For mobile platforms, use the file path
          if (file.path != null) {
            request.files.add(await http.MultipartFile.fromPath(
              'file_input',
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