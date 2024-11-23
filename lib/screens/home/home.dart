import 'package:companion_app/models/udata.dart';
import 'package:companion_app/screens/home/countdown-page.dart';
import 'package:companion_app/screens/home/setting_form.dart';
import 'package:companion_app/screens/quiz/main_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:companion_app/services/auth.dart';
import 'package:companion_app/services/database.dart';
import 'package:companion_app/screens/home/udata_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companion_app/models/auser.dart';
import 'package:companion_app/screens/home/udata_page.dart';
import 'home_page.dart';
import 'consult_page.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:companion_app/screens/home/sounds_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  /*
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this); // Set the length to 1
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  */

  void _showProfilePanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: SettingForm(),
          );
        });
  }

  void _showUdataPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UdataPage()), // Navigate to UdataPage
    );
  }


  void _showMainQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MainQuiz()), // Navigate to MainQuizPage
    );
  }


  final tabs = [
    const HomePage(),
    CountdownPage(),
    const ConsultPage(),
    AudioPage(),
    UdataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Auser? currentUser = Provider.of<Auser?>(context);
    final String uid = currentUser?.uid ?? '';

    return Scaffold(
      //backgroundColor: Colors.purple[50],
      //backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(width: 1),
            ),
            Expanded(
              flex: 12,
              child: const Text('MindEase',
              style: TextStyle(
                fontFamily: 'FontMainHeavy',
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(width: 1),
            ),
          ],
        ),
        //'       𝐌𝐢𝐧𝐝𝐄𝐚𝐬𝐞'
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text('Logout'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text(
                'Options',
                style: TextStyle(
                  fontFamily: 'FontMain',
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile',
                style: TextStyle(
                  fontFamily: 'FontMain',
                ),
              ),
              onTap: () => _showProfilePanel(),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings_solid),
              title: Text('Settings',
                style: TextStyle(
                  fontFamily: 'FontMain',
                ),
              ),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_2_fill),
              title: Text('Help & Support',
                style: TextStyle(
                  fontFamily: 'FontMain',
                ),
              ),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            // Add more ListTile widgets for additional items
          ],
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.sun_haze),
              label: 'Meditate',
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble),
              label: 'Consult',
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.headphones),
              label: 'Sounds',
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group),
              label: 'Friends',
              backgroundColor: Colors.deepPurpleAccent,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
