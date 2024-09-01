import 'dart:convert';

import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/view/home_screen.dart';
import 'package:calendly_clone/widgets/reuse_snakbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GenerateAutoToken {
  void getNewTokenFunc() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    String _token = prefes.getString('token') ?? 'empty';
    print('old Token: $_token');
    var response =
        await http.get(Uri.parse(ApiUrls.newTokenGeneraterUrl), headers: {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      checkUserEmailValid(
          prefes.getString('email').toString(), prefes.getString('token'));

      // Get.to(() => const HomeScreen());
    } else if (response.statusCode == 401) {
      var body2 = jsonEncode({
        'email': prefes.getString('email'),
        'password': prefes.getString('passward')
      });
      var response2 = await http.post(Uri.parse(ApiUrls.loginAccountUrl),
          headers: {'Content-Type': 'application/json'}, body: body2);
      if (response2.statusCode == 200) {
        var data2 = jsonDecode(response2.body);

        ReuseSnakbar().snakbar('Token Updated');
        prefes.setString('token', data2['accessToken']);
        print('new Token: ${prefes.getString('token')}');

        checkUserEmailValid(
            prefes.getString('email').toString(), prefes.getString('token'));
      }

      // prefes.setString('key', data)
    }
  }

  void checkUserEmailValid(String email, token) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(ApiUrls.userListUrl), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      int matchEmailIndex = 0;
      List data = jsonDecode(response.body);
      print(' list Data :$data');

      for (var i = 0; i < data.length; i++) {
        print("loop email : ${data[i]['email'].toString()} \n");
        print("prefes email: ${prefes.getString('inputEmail')}");
        if (data[i]['email'].toString().toLowerCase() ==
            prefes.getString('inputEmail')!.toLowerCase()) {
          print('email match');
          matchEmailIndex = i;
          print("matchEmailIndex: $matchEmailIndex");
          break;
        }
      }
      if (data[matchEmailIndex]['email'].toString().toLowerCase() ==
          prefes.getString('inputEmail')!.toLowerCase()) {
        Get.to(() => const HomeScreen());
        ReuseSnakbar().snakbar('sucessfully login');
      } else {
        ReuseSnakbar().snakbar('incorrect email');
      }
    }
  }
}
