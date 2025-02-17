import 'package:flutter/cupertino.dart';

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
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
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
    );
  }

  Widget _buildUserItem(Map<String, String> user) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              user['avatar']!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          user['avatar']!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('User List'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            CupertinoIcons.person_2,
            color: CupertinoColors.activeBlue,
          ),
          onPressed: () => _showUsersModal(context),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: users.map((user) => _buildUserItem(user)).toList(),
          ),
        ),
      ),
    );
  }
}
