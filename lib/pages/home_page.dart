import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_chat_app/components/my_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //Logo and message
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //icon
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 70,
                    child: Icon(
                      CupertinoIcons.chat_bubble_fill,
                      size: 70,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    // color: Colors.white,
                  ),

                  SizedBox(height: 40),

                  //text
                  Text(
                    'Welcome back,we have missed you',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              //search bar
              title: MyTextfield(
                controller: searchController,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, size: 30),
                obscureText: false,
                borderRadius: 20,
              ),
            ),

            //recent chat
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
