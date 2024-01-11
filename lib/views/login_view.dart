import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import 'package:future_me/components/app_text_field.dart';
import 'package:future_me/components/shared/box_shadow.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:future_me/model/UserModel.dart';
import 'package:future_me/services/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_notification/in_app_notification.dart';

import '../components/shared/show_toast.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    @override
    void dispose() {
      _usernameController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login To Your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // boxShadow: [greyBoxShadow],
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: width * 0.9,
                    child: AppTXTField(
                        hintMessage: "Username",
                        controller: _usernameController,
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          var data =
                              await _authService.signInWithEmailAndPassword(
                                  _usernameController.text,
                                  _passwordController.text);
                          print(data);
                          UserModel userModel = UserModel(
                              displayName: data.user!.displayName.toString(),
                              email: data.user!.email,
                              uid: data.user!.uid);
                          print(userModel.uid);
                        } catch (e) {
                          InAppNotification.show(
                            child: showToast(
                                msg: "Authentication failed, please try again"),
                            context: context,
                            duration: Duration(milliseconds: 2000),
                            onTap: () => print('Notification tapped!'),
                          );
                          print("Error $e");
                        }
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
                          'Login',
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
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: redColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push("/register"),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
