import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:future_me/services/auth.dart';
import 'package:go_router/go_router.dart';

import '../components/app_text_field.dart';
import '../components/shared/box_shadow.dart';
import '../components/shared/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Register"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Register for Your Future Me Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.06,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          UserField(
                              width: width,
                              icon: Icons.person,
                              usernameController: _usernameController),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          UserField(
                              icon: Icons.email,
                              width: width,
                              usernameController: _emailController),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PasswordField(
                              width: width,
                              passwordController: _passwordController),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Confirm Password",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PasswordField(
                              width: width,
                              passwordController: _confirmPasswordController),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((userCredential) {
                              User? user = userCredential.user;
                              if (user != null) {
                                // After creating the user, update the user's profile with the username
                                user
                                    .updateDisplayName(_usernameController.text)
                                    .then((_) {
                                  // Username updated successfully
                                  print(
                                      'User created with username: ${user.displayName}');
                                  print('Email: ${user.email}');
                                  context.go("/login");
                                  // Any additional operations after successful user creation
                                }).catchError((error) {
                                  // Handle errors while updating the username
                                  print('Error updating username: $error');
                                });
                              }
                            }).catchError((error) {
                              // Handle createUserWithEmailAndPassword errors
                              print('Error creating user: $error');
                            });

                            setState(() {
                              // text = _usernameController.text;
                            });
                          }
                        },
                        child: Container(
                          width: width * 0.5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [greyBoxShadow],
                            border: Border(
                              left: BorderSide(width: 4, color: ghostWhite),
                              top: BorderSide(width: 4, color: ghostWhite),
                              bottom: BorderSide(width: 4, color: ghostWhite),
                              right: BorderSide(width: 4, color: ghostWhite),
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: redColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.width,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final double width;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // boxShadow: [greyBoxShadow],
          color: orangeColor,
          borderRadius: BorderRadius.circular(20)),
      width: width * 0.9,
      child: AppTXTField(
          controller: _passwordController,
          hintMessage: "********",
          obscure: true,
          icon: Icon(
            Icons.lock,
            color: Colors.white,
          )),
    );
  }
}

class UserField extends StatelessWidget {
  const UserField({
    super.key,
    required this.width,
    required this.icon,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController;

  final double width;
  final TextEditingController _usernameController;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // boxShadow: [greyBoxShadow],
          color: orangeColor,
          borderRadius: BorderRadius.circular(20)),
      width: width * 0.9,
      child: AppTXTField(
          hintMessage: "",
          controller: _usernameController,
          icon: Icon(
            icon,
            color: Colors.white,
          )),
    );
  }
}
