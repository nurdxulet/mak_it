import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mak_it/screens/users_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool obscureEmail = true;
  bool obscurePassword = false;

  void logIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return UsersScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('images/bg-1.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            emailFocusNode.hasFocus || passwordFocusNode.hasFocus
                ? const SizedBox()
                : Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: const Text(
                      'Вход',
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 48,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(49),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      focusNode: emailFocusNode,
                      labelText: 'Email',
                      customObscure: false,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      labelText: 'Пароль',
                      customObscure: true,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        logIn();
                        /* _emailController.value.text.isNotEmpty &&
                                _passwordController.value.text.isNotEmpty
                            ? logIn()
                            : print("Поле 'Email' или 'Пароль' пустые"); */
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
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String labelText;
  final bool customObscure;

  const CustomTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.labelText,
    required this.customObscure,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.customObscure,
      onTap: () {
        widget.focusNode.requestFocus();
        setState(() {
          FocusScope.of(context).unfocus();
        });
      },
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.focusNode.hasFocus
              ? const Color(0xff9B51E0)
              : const Color(0xff999999),
          fontSize: 16,
        ),
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
