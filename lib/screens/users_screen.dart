import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mak_it/screens/error_screen.dart';
import '../users.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreen();
}

class _UsersScreen extends State<UsersScreen> {
  var jsonResponse = [];

  @override
  void initState() {
    super.initState;
  }

  Future getUserData() async {
    try {
      Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body) as List<dynamic>;

        log(jsonResponse.length.toString());
        return jsonResponse;
      } else {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ErrorScreen();
            },
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ErrorScreen();
          },
        ),
      );
    }
  }

  bool appBarTextVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    pinned: true,
                    // forceElevated: true,
                    elevation: 10,
                    // floating: true,
                    // snap: true,
                    expandedHeight: 120.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'Пользователи',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      // background: FlutterLogo(),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                  ),
                  // SliverFillRemaining(
                  SliverToBoxAdapter(
                    // hasScrollBody: true,
                    child: Users(jsonResponse: jsonResponse),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
