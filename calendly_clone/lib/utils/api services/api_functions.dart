import 'dart:async';
import 'dart:convert';

import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/utils/api%20services/generate_auto_token.dart';
import 'package:calendly_clone/widgets/reuse_snakbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Apifunctions {
  Future postApiFunc(String postApiUrl, body) async {
    try {
      print('Post Api running');
      await GenerateAutoToken().getNewTokenFunc(false);
      SharedPreferences prefes = await SharedPreferences.getInstance();
      var userid = prefes.getString('id').toString();
      String? _token = prefes.getString('token');
      var respone = await http.post(Uri.parse(postApiUrl),
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));
      if (respone.statusCode == 200) {
        var data = jsonDecode(respone.body);
        print('GetApi Data Sucessfully comming');
        return data;
      } else {
        print(' Response code ${respone.statusCode}');
        print(' Response ${respone.body}');
        ReuseSnakbar().snakbar(respone.body);
      }
    } catch (e) {
      print("catch error: $e");
    }
  }

  Future getApifunc(
    String apiUrl,
  ) async {
    try {
      print('Get Api running');
      await GenerateAutoToken().getNewTokenFunc(false);
      SharedPreferences prefes = await SharedPreferences.getInstance();
      var userid = prefes.getString('id').toString();
      String? _token = prefes.getString('token');

      print('Token: $_token');
      print('Userid: $userid');

      var response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('GetApi Data Sucessfully comming');
        return data;
      } else {
        print(' Response code ${response.statusCode}');
        print(' Response ${response.body}');
      }
    } catch (e) {
      print('catch Error $e');
    }
  }

  Future<void> userUpdate(String firstName, lastName, email, passward) async {
    try {
      print('Update function running');
      await GenerateAutoToken().getNewTokenFunc(false);
      SharedPreferences prefes = await SharedPreferences.getInstance();
      var userid = prefes.getString('id').toString();
      String? _token = prefes.getString('token');

      print('Token: $_token');
      print('Userid: $userid');

      var body = jsonEncode({
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': passward,
        'usertype_id': userid,
      });

      var response = await http
          .put(Uri.parse(ApiUrls.userUpdateUrl + userid), body: body, headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        ReuseSnakbar().snakbar(response.body);
        prefes.setString('firstname', firstName);
        prefes.setString('lastname', lastName);
        prefes.setString('email', email);
        prefes.setString('password', passward);
        print('Sucessfully Updated');
      } else {
        print(' Response code ${response.statusCode}');
        print(' Response ${response.body}');
      }
    } catch (e) {
      print('userUpdate func Error $e');
    }
  }

  void deletUser() async {
    try {
      SharedPreferences prefes = await SharedPreferences.getInstance();
      var userid = prefes.getString('id').toString();
      String? _token = prefes.getString('token');

      print('Token: $_token');
      print('Userid: $userid');
      var response = await http
          .delete(Uri.parse('${ApiUrls.userDeleteUrl}/$userid'), headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        ReuseSnakbar().snakbar(response.body);
      } else {
        print("Error Response statuscode: ${response.statusCode}");
      }
    } catch (e) {
      print('deterUSer Func Error $e');
    }
  }
}
