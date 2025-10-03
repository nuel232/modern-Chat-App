import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          children: [
            //icon
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 70,
              child: Icon(
                CupertinoIcons.person,
                size: 70,
                color: Theme.of(context).colorScheme.surface,
              ),
              // color: Colors.white,
            ),

            SizedBox(height: 20),

            Text(
              'Profile',
              style: TextStyle(
                fontSize: 35,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),

            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  SizedBox(height: 10),

                  ListTile(
                    title: Text('Email'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  SizedBox(height: 10),

                  ListTile(
                    title: Text('phone'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
