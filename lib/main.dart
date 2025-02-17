import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Map<String, String>> users = [
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
    {'name': 'Luis Gabrielle Estacio', 'avatar': 'assets/images/LuisAvatar.jpg'},
  ];

  void _showUsersModal(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => Center( // Wrap with Center widget
        child: CupertinoActionSheet(
          title: Text("Teams", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          message: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: users.map((user) => _buildUserAvatar(user)).toList(),
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Text("Close", style: TextStyle(color: CupertinoColors.destructiveRed)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserItem(Map<String, String> user) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(user['avatar']!),
            radius: 40,
          ),
          SizedBox(width: 15),
          Text(
            user['name']!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(Map<String, String> user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(user['avatar']!),
        radius: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/LuisAvatar.jpg'),
            radius: 15,
          ),
        ),
        middle: Text('Chats'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            CupertinoIcons.pencil,
            color: CupertinoColors.white,
          ),
          onPressed: () => _showUsersModal(context),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                placeholder: 'Search',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: users.map((user) => _buildUserItem(user)).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}