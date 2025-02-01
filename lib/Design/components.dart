import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this. hintText,
    required this. obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Material(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Theme.of(context).colorScheme.inversePrimary)
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)
          ),
        ),
      ),
    );
  }
}

class MyAuthTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyAuthTextField({
    super.key,
    required this.controller,
    required this. hintText,
    required this. obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Material(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
              fillColor: Colors.grey[200],
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}