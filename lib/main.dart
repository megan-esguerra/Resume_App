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
      'address': '#000 Purok 2 P gulut San Nicolas Sta Ana Pampanga',
      'email': 'estacio.gabrielle31@gmail.com',
      'lastMessage': 'Hello!',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '096865764654'
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
      'name': 'John Ivan C. Baligod',
      'avatar': 'assets/images/JohnnIvanAvatar.jpg',
      'address': '15-C Sapang Putot Sta Maria Sta Ana Pampanga',
      'email': 'johnivanbaligod30@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09208738510'
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

  //Added When CLick It will Popup the Information
  void _showUserDetailsModal(Map<String, String> user) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(
          user['name'] ?? 'No Name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        message: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                user['avatar'] ?? 'assets/images/defaultAvatar.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text('Address: ${user['address'] ?? 'N/A'}'),
            Text('Email: ${user['email'] ?? 'N/A'}'),
            Text('Grade/Section: ${user['gradeSection'] ?? 'N/A'}'),
            Text('Contact: ${user['contactNumber'] ?? 'N/A'}'),
          ],
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


  //Added Modal
  Widget _buildUserItem(Map<String, String> user) {
    return GestureDetector(
      onTap: () => _showUserDetailsModal(user),  // Trigger modal on tap
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
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
              child: Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  user['name'] ?? 'No Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
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
  Widget _buildStoryAvatar(String avatarPath, String name, int unreadMessages) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatarPath),
              radius: 30,
            ),
            if (unreadMessages > 0) // Show badge only if there are unread messages
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.rectangle,

                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      unreadMessages > 9 ? '9+' : unreadMessages.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.bars),
          onPressed: () {},
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
                  borderRadius: BorderRadius.circular(25),
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
                    _buildStoryAvatar('assets/images/AdrianAvatar.jpg', 'Adrian', 100),
                    SizedBox(width: 20),
                    // Added New Avatar Section
                    _buildStoryAvatar('assets/images/LuisAvatar.jpg', 'Luis', 12),
                    // Added New Avatar Section Here
                    SizedBox(width: 15),
                    _buildStoryAvatar('assets/images/KristelAvatar.png', 'Kristel', 21),
                    // Added New Avatar Section
                    // Added New Avatar Section Here
                    // Added New Avatar Section Here

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