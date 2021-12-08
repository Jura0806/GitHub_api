import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mygitinfo/models/user_model.dart';

class Network {

  static Future<String?> getJsonData() async {
    var uri = Uri.parse('https://api.github.com/users/Jura0806');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Request failed with status: ${response.statusCode}.';
    }
  }

  static MyGithubModel? parseMyGit(String body) {
    dynamic json = jsonDecode(body);
    var data = MyGithubModel.fromJson(json);
    return data;
  }
}