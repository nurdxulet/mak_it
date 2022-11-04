import 'package:flutter/material.dart';
import 'package:mak_it/screens/users_screen.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 76,
              width: 66.28,
              child: Icon(
                Icons.warning_amber,
                color: const Color(0xff9B51E0),
                size: 75,
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              'Не удалось загрузить информацию',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              width: 230,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UsersScreen();
                  }));
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xff9B51E0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Обновить',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
