import 'dart:core';
import 'package:flutter/material.dart';

class AppTXTField extends StatefulWidget {
  const AppTXTField(
      {Key? key,
      this.icon,
      required this.controller,
      this.obscure = false,
      this.suggestions,
      this.autoCorrect,
      required this.hintMessage})
      : super(key: key);

  final TextEditingController controller;
  final Widget? icon;
  final bool obscure;
  final bool? suggestions;
  final bool? autoCorrect;
  final String hintMessage;

  @override
  _AppTXTFieldState createState() => _AppTXTFieldState();
}

class _AppTXTFieldState extends State<AppTXTField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: widget.obscure && _isObscured,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        prefixIcon: widget.icon != null ? widget.icon : Icon(Icons.add),
        suffixIcon: widget.obscure
            ? IconButton(
                icon: _isObscured
                    ? Icon(
                        Icons.visibility,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : Icon(null),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: widget.hintMessage,
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
