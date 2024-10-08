import 'package:companion_app/models/udata.dart';
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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();

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

  void _showProfilePanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: SettingForm(),
      );
    });
  }

  void _showUdataPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UdataPage()), // Navigate to UdataPage
    );
  }
  void _showMainQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainQuiz()), // Navigate to MainQuizPage
    );
  }

  @override
  Widget build(BuildContext context) {
    final Auser? currentUser = Provider.of<Auser?>(context);
    final String uid = currentUser?.uid ?? '';

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('𝙲𝚘𝚖𝚙𝚊𝚗𝚒𝚘𝚗 𝙰𝚙𝚙'),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tasks'),
            // Remove the second tab
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () => _showProfilePanel(),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('help'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            // Add more ListTile widgets for additional items
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://designimages.appypie.com/appbackground/appbackground-13-petal-plant.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: _showUdataPage,
                    child: Icon(Icons.people),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 100,
                  child: FloatingActionButton(
                    onPressed: _showMainQuizPage,
                    child: Icon(Icons.question_mark),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
