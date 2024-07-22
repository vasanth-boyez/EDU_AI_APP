import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:to_do_list_app/Authtentication/home.dart';
import 'UserDashboard.dart';

class LogInButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String text;
  const LogInButton(
      {super.key,
      required this.text,
      required this.usernameController,
      required this.passwordController});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 120),
      decoration: BoxDecoration(
        color: Color.fromARGB(251, 52, 124, 4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () async {
          String username = usernameController.text;
          String password = passwordController.text;
          Uri url = Uri.parse("http://localhost:8080/send-data");
          Map<String, String> headers = {"Content-type": "application/json"};

          String json =
              '{"message": "Hello from Flutter","username": "$username","password": "$password"}';
          http.Response response =
              await http.post(url, headers: headers, body: json);
          if (response.statusCode == 200) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserDashboard()),
            );
            print('Data sent successfully');
          } else {
            print('Failed to send data. Status code: ${response.statusCode}');
          }
        },
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
