import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));//aaa
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Map<String, String>> users = [
    {
      'name': 'Luis Gabrielle Estacio',
      'avatar': 'assets/images/LuisAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
    {
      'name': 'Adrian Mhaki Macabali',
      'avatar': 'assets/images/AdrianAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
    {
      'name': 'Kristel A. Culala',
      'avatar': 'assets/images/KristelAvatar.png',
      'address': '#106 P., Pescadores, Candaba, Pampanga',
      'email': 'kristelariasculala@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '098604672231'
    },
    {
      'name': 'Luis Gabrielle Estacio',
      'avatar': 'assets/images/LuisAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
    {
      'name': 'Luis Gabrielle Estacio',
      'avatar': 'assets/images/LuisAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
    {
      'name': 'Luis Gabrielle Estacio',
      'avatar': 'assets/images/LuisAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
    {
      'name': 'Luis Gabrielle Estacio',
      'avatar': 'assets/images/LuisAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
    {
      'name': 'Luis Gabrielle Estacio',
      'avatar': 'assets/images/LuisAvatar.jpg',
      'address': '#564 Sitio SUmppung, San Patricio, Mexico, Pamppanga',
      'email': 'adrianmhakimacabali@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09696412682'
    },
  ];

  void _showUsersModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) =>
          CupertinoActionSheet(
            title: Text(
              "Teams",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
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
                child: Text(
                  "Close",
                  style: TextStyle(color: CupertinoColors.destructiveRed),
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildUserItem(Map<String, String> user) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              user['avatar'] ?? 'assets/images/defaultAvatar.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'] ?? 'No Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (user.containsKey('address'))
                  Text(
                    user['address']!,
                    style: TextStyle(fontSize: 14),
                  ),
                if (user.containsKey('email'))
                  Text(
                    user['email']!,
                    style: TextStyle(fontSize: 14),
                  ),
                if (user.containsKey('gradeSection'))
                  Text(
                    user['gradeSection']!,
                    style: TextStyle(fontSize: 14),
                  ),
                if (user.containsKey('contactNumber'))
                  Text(
                    user['contactNumber']!,
                    style: TextStyle(fontSize: 14),
                  ),
              ],
            ),
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
          user['avatar'] ?? 'assets/images/defaultAvatar.jpg',
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Search Bar
                CupertinoSearchTextField(
                  placeholder: 'Search',
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(CupertinoIcons.add, color: Colors.white, size: 30),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Your Story", style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey)),
                      ],
                    ),
                    SizedBox(width: 20),
                    // Added New Avatar Section
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/AdrianAvatar.jpg'),
                          radius: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Adrian",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),

                    // Added New Avatar Section
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/LuisAvatar.jpg'),
                          radius: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Luis",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    // Added New Avatar Section Here
                    SizedBox(width: 15),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/KristelAvatar.png'),
                          radius: 30,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Kristel",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Added New Avatar Section

                    // Added New Avatar Section Here

                    // Added New Avatar Section Here
                  ],
                ),


                SizedBox(height: 15),

                // User List
                Column(
                  children: users.map((user) => _buildUserItem(user)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}