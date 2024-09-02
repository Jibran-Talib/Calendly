import 'dart:convert';

import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/view/home_screen.dart';
import 'package:calendly_clone/widgets/reuse_snakbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GenerateAutoToken {
  Future<void> getNewTokenFunc(bool forloginScreen) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    String _token = prefes.getString('token') ?? 'empty';
    print('old Token: $_token');
    var response =
        await http.get(Uri.parse(ApiUrls.newTokenGeneraterUrl), headers: {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      print('old Token still Valid');

      var data = jsonDecode(response.body);

      //Check User Email Validity
      checkUserEmailValid(prefes.getString('email').toString(),
          prefes.getString('token'), forloginScreen);

      // Get.to(() => const HomeScreen());
    } else if (response.statusCode == 401) {
      print("email ${prefes.getString('email')}");

      var body2 = jsonEncode({
        'email': prefes.getString('inputEmail'),
        'password': prefes.getString('inputPassward')
      });
      var response2 = await http.post(Uri.parse(ApiUrls.loginAccountUrl),
          headers: {'Content-Type': 'application/json'}, body: body2);
      if (response2.statusCode == 200) {
        var data2 = jsonDecode(response2.body);

        // ReuseSnakbar().snakbar('Token Updated');
        prefes.setString('token', data2['accessToken']);
        print('New Token Sucesfuly Genrated');
        print('new Token: ${prefes.getString('token')}');

        checkUserEmailValid(prefes.getString('email').toString(),
            prefes.getString('token'), forloginScreen);
      } else {
        print("response 2 status code ${response2.statusCode}");
      }

      // prefes.setString('key', data)
    }
  }

  Future<void> checkUserEmailValid(
      String email, token, bool showsnakbar) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(ApiUrls.userListUrl), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      int matchEmailIndex = 0;
      List data = jsonDecode(response.body);

      for (var i = 0; i < data.length; i++) {
        if (data[i]['email'].toString().toLowerCase() ==
            prefes.getString('inputEmail')!.toLowerCase()) {
          print('email match');
          matchEmailIndex = i;

          break;
        }
      }
      if (data[matchEmailIndex]['email'].toString().toLowerCase() ==
          prefes.getString('inputEmail')!.toLowerCase()) {
        prefes.setString('id', data[matchEmailIndex]['id'].toString());
        prefes.setString(
            'firstname', data[matchEmailIndex]['firstname'].toString());
        prefes.setString(
            'lastname', data[matchEmailIndex]['lastname'].toString());
        prefes.setString('email', data[matchEmailIndex]['email'].toString());
        prefes.setString(
            'password', data[matchEmailIndex]['password'].toString());
        showsnakbar ? Get.to(() => const HomeScreen()) : null;
        showsnakbar ? ReuseSnakbar().snakbar('sucessfully login') : null;
      } else {
        showsnakbar ? ReuseSnakbar().snakbar('incorrect email') : null;
      }
    }
  }
}
