import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {

  final String text;
  final String sectionName;
  final void Function()? onPressed;

  const ProfileEdit({super.key, required this.text, required this.sectionName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SECTION NAME
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //SECTION NAME
              Text(sectionName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),

              //EDIT BTN
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.inversePrimary,
                  ))
            ],
          ),

          //TEXT
          Text(text),

        ],
      ),
    );
  }
}

class UserName extends StatelessWidget {

  final String text;

  const UserName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SECTION NAME

          //TEXT
          Text(text),

        ],
      ),
    );
  }
}