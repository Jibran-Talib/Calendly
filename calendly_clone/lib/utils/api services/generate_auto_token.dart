import 'dart:convert';

import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/widgets/reuse_snakbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GenerateAutoToken {
  void getNewTokenFunc() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    String _oldToken = prefes.getString('oldToken') ?? 'empty';
    print('old Token: $_oldToken');
    var response =
        await http.get(Uri.parse(ApiUrls.newTokenGeneraterUrl), headers: {
      'Authorization': 'Bearer $_oldToken',
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      ReuseSnakbar().snakbar('Login Sucessfully');
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
        prefes.setString('oldToken', data2['accessToken']);
        print('new Token: ${prefes.getString('oldToken')}');
      }

      // prefes.setString('key', data)
    }
  }
}
