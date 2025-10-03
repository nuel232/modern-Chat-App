import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //icon
            //icon
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 20,
              child: Icon(
                CupertinoIcons.person,
                size: 20,
                color: Theme.of(context).colorScheme.surface,
              ),
              // color: Colors.white,
            ),

            SizedBox(width: 10),

            //name
            Text(text),

            //message
          ],
        ),
      ),
    );
  }
}
