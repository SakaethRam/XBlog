import 'package:flutter/material.dart';

class SignBtn extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const SignBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
      
          ),
        ),
      ),
    );
  }
}

class DeleteBtn extends StatelessWidget {
  final void Function()? onTap;
  const DeleteBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.delete,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
