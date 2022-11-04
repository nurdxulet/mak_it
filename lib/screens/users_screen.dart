import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mak_it/screens/error_screen.dart';
import 'package:mak_it/screens/login_screen.dart';

import '../users.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreen createState() => _UsersScreen();
}

class _UsersScreen extends State<UsersScreen> {
  var jsonResponse = [];

  @override
  void initState() {
    super.initState;
    getUserData();
  }

  getUserData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        jsonResponse = jsonDecode(response.body) as List<dynamic>;
      });
      print(jsonResponse.length);
      return jsonResponse as List<dynamic>;
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ErrorScreen();
      }));
    }
  }

  back() {
    Navigator.pop(context);
  }

  bool appBarTextVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            // forceElevated: true,
            elevation: 10,
            floating: true,
            snap: true,
            title: Visibility(
              visible: appBarTextVisibility,
              child: const Text(
                'Пользователи',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
        ],
        body: Users(jsonResponse: jsonResponse),
      ),
    );
  }
}
