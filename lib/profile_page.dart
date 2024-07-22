import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<UserProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool _isEditing = false;

  // Function to fetch user profile from the database
  Future<void> fetchUserProfile() async {
    // Make an API call to fetch user profile data
    Uri url = Uri.parse("http://localhost:8080/send");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);
      setState(() {
        _nameController.text = userData['name'];
        _emailController.text = userData['email'];
        _addressController.text = userData['address'];
        _phoneController.text = userData['phone'];
      });
    } else {
      // Handle error
      print('Failed to fetch user profile data. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserProfile(); // Fetch user profile data when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              fillColor: Color.fromARGB(251, 140, 231, 94).withOpacity(0.2),
              filled: true,
            ),
            enabled: _isEditing,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              fillColor: Color.fromARGB(251, 140, 231, 94).withOpacity(0.2),
              filled: true,
            ),
            enabled: _isEditing,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Address',
              fillColor: Color.fromARGB(251, 140, 231, 94).withOpacity(0.2),
              filled: true,
            ),
            enabled: _isEditing,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              fillColor: Color.fromARGB(251, 140, 231, 94).withOpacity(0.2),
              filled: true,
            ),
            enabled: _isEditing,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
             
                onPressed: _isEditing
                    ? () async {
                        // Save button logic
                        String Name = _nameController.text;
                        String Email = _emailController.text;
                        String Address = _addressController.text;
                        String Phone = _phoneController.text;

                        Uri url = Uri.parse("http://localhost:8080/profile");
                        Map<String, String> headers = {"Content-type": "application/json"};

                        String json =
                         '{"message": "Hello from Flutter","name": "$Name","email": "$Email","address": "$Address","phone": "$Phone"}';
                        http.Response response = await http.post(url, headers: headers, body: json);
                       if (response.statusCode == 200) {
                         //Navigator.push(context,MaterialPageRoute(builder: (context) => const UserDashboard()),);
                        print('Data sent successfully');
                      } else {
                       print('Failed to send data. Status code: ${response.statusCode}');
                      }


                        // Here you can send the data to your backend
                        // Example:
                        // await sendUserData(name, email, address, phone);
                        setState(() {
                          _isEditing = false;
                        });
                      }
                    : null,
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Edit button logic
                  setState(() {
                    _isEditing = true;
                  });
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
