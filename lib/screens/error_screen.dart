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
            Icon(Icons.warning_amber),
            Text('Не удалось загрузить информацию'),
            ElevatedButton(
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
                    'Войти',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
/* const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);
final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
final spinkit = SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
); */