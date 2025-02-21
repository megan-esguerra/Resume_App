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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      'name': 'Megan D. Esguerra',
      'avatar': 'assets/images/MeganAvatar.jpg',
      'address': '0066 Arenas,Arayat,Pampanga',
      'email': '0906megan64@gmail.com',
      'gradeSection': 'BSIT-3A',
      'contactNumber': '09360720522'
    },


  ];

  void _showUsersModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Center(
        child: CupertinoActionSheet(
          message: Material(
            color: Colors.transparent,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double avatarSize = screenWidth < 400 ? 50 : 70;
                double spacing = screenWidth < 400 ? 10 : 20;

                return Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "DevOps Teams",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: spacing,
                        runSpacing: spacing,
                        children: users
                            .map((user) => _buildUserAvatarResponsive(user, avatarSize))
                            .toList(),
                      ),
                      SizedBox(height: 15),
                      CupertinoButton(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            color: CupertinoColors.destructiveRed,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserAvatarResponsive(Map<String, String> user, double size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundImage: AssetImage(user['avatar']!),
        ),
        SizedBox(height: 5),
        Text(
          user['name']!.split(' ')[0], // Display only the first name
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }


  //Your Story Modal
  void _showStoryModal(String avatarPath, String name, String message) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        message: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                avatarPath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
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

  //Update Search
  List<Map<String, String>> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = users;
  }
  // Search Functionality
  void _filterUsers(String query) {
    List<Map<String, String>> results = [];
    if (query.isEmpty) {
      results = users;
    } else {
      results = users
          .where((user) =>
          user['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredUsers = results;
    });
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                children: [
                  Text(
                    user['name'] ?? 'No Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5), // Space between name and email
                  Text(
                    'Email: ${user['email'] ?? 'N/A'}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }



  // Widget _buildUserAvatar(Map<String, String> user) {
  //   return Column(
  //     children: [
  //       CircleAvatar(
  //         radius: 30,
  //         backgroundImage: AssetImage(user['avatar']!),
  //       ),
  //       SizedBox(height: 5),
  //       Text(
  //         user['name']!.split(' ')[0], // Display only first name
  //         style: TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildStoryAvatar(String avatarPath, String name, String message) {
    return GestureDetector(
      onTap: () => _showStoryModal(avatarPath, name, message),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarPath),
                radius: 30,
              ),
              if (message.isNotEmpty)
                Positioned(
                  left: -4,
                  top: -4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
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
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: _scaffoldKey,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(
            CupertinoIcons.bars,
            color: CupertinoColors.white,
          ),
        ),
        middle: Text('Resume'),
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
                  backgroundColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(25),
                  style: TextStyle(color: Colors.white),
                  placeholderStyle: TextStyle(color: Colors.grey[400]),
                  onChanged: (query) => _filterUsers(query),
                ),


                SizedBox(height: 15),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
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
                          SizedBox(height: 20),
                          Text("Your Story", style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey)),
                        ],
                      ),
                      SizedBox(width: 20),
                      _buildStoryAvatar('assets/images/AdrianAvatar.jpg', 'Adrian', 'kiss 😽'),
                      SizedBox(width: 20),
                      _buildStoryAvatar('assets/images/LuisAvatar.jpg', 'Luis', 'Sheesh~~💩'),
                      SizedBox(width: 15),
                      _buildStoryAvatar('assets/images/KristelAvatar.png', 'Kristel', '😵‍💫'),
                      SizedBox(width: 20),
                      _buildStoryAvatar('assets/images/MeganAvatar.jpg', 'Megan', '💻'),
                      SizedBox(width: 20),
                      _buildStoryAvatar('assets/images/JohnnIvanAvatar.jpg', 'John Ivan', "🍵"),
                    ],
                  ),
                ),




                SizedBox(height: 15),

                // User List (Filtered)
                Column(
                  children:
                  _filteredUsers.map((user) => _buildUserItem(user)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}