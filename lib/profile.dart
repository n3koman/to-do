import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    setState(() {
      user = jsonDecode(response.body)[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: user == null
          ? Center(child: Text('Loading...'))
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Id of this user: ${user!['id']}'),
                  Text('Name: ${user!['name']}'),
                  Text('Username: ${user!['username']}'),
                  Text('Email: ${user!['email']}'),
                  Text('Phone: ${user!['phone']}'),
                  Text('Website: ${user!['website']}'),
                  Text(
                      'Address: ${user!['address']['street']}, ${user!['address']['suite']}, ${user!['address']['city']}'),
                  Text('Company: ${user!['company']['name']}'),
                ],
              ),
            ),
    );
  }
}
