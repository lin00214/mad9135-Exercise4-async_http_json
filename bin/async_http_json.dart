import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../lib/async_http_json.dart';

void main() async {
    try {
        final uri = Uri.parse('https://dummyjson.com/users?limit=12');
        final response = await http.get(uri);

        if (response.statusCode == 200) {
            Map<String, dynamic> jsonData = convert.jsonDecode(response.body);
            List<dynamic> jsonUsers = jsonData['users'];
            List<User> users = [];

            for (var jsonUser in jsonUsers) {
                User user = User.fromJson(jsonUser);
                users.add(user);
            }

            print("Get user list successfully");
            for (var user in users) {
                user.userInformation();
            }
        } else {
            print('Failed http request $uri');
        }
    } catch (error) {
        print('Failed http request: $error');
    }
}