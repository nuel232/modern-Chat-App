import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_chat_app/components/my_textfield.dart';
import 'package:modern_chat_app/components/user_tile.dart';
import 'package:modern_chat_app/pages/chat_page.dart';
import 'package:modern_chat_app/services/auth/auth_service.dart';
import 'package:modern_chat_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _auth = AuthService();

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

            //Recent chat header
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'Recent Chats',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            //User list
            _buildUserList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('Error loading users'),
              ),
            ),
          );
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        // Get the list of users
        final users = snapshot.data!;

        // If no users, show empty state
        if (users.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('No users found'),
              ),
            ),
          );
        }

        // Return a SliverList with users
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildUserListItem(users[index], context),
            );
          }, childCount: users.length),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    //display all users except current user
    return UserTile(
      text: userData['email'],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(receiverEmail: userData['email']),
          ),
        );
      },
    );
  }
}
