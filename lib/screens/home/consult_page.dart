import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/services.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    var arrNames = [
      'Dr. Raman Taneja',
      'Dr. Gaurav Tripathi',
      'Dr. Vishwajeet Patel',
      'Dr. Tanisha Mittal',
      'Dr. Saurabh Mehra',
      'Dr. Kanishk Singh',
      'Dr. B. S. Judge',
      'Dr. Aryan Chaudhary',
      'Dr. Ayushri Rajora',
      'Dr. Himesh Agarwal'
    ];

    var arrPics = [
      'assets/images/dog-in-park.jpg',
      'assets/images/male_doctor.jpg'
    ];

    var arrNumbers = [
      '9876543210',
      '9876543211',
      '9876543212',
      '9876543213',
      '9876543214',
      '9876543215',
      '9876543216',
      '9876543217',
      '9876543218',
      '9876543219',
    ];

    void _callPhoneNumber(String phoneNumber) async {
      String url = 'tel:$phoneNumber';
      try {
        await launchUrlString(url);
      } on PlatformException catch (e) {
        throw 'Could not make the phone call: ${e.message}';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Consult Mental Health Professionals', style: TextStyle(
            fontFamily: 'FontMainHeavy',
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            //leading: Text('${index+1}'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/female_doctor.png'),
              backgroundColor: Colors.deepPurple,
            ),
            title: Text(arrNames[index], style: TextStyle(
              fontFamily: 'FontMainSemibold',
            ),),
            subtitle: Text(arrNumbers[index], style: TextStyle(
              fontFamily: 'FontMain',
            ),),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.phone_fill),
              onPressed: () => _callPhoneNumber(arrNumbers[index]), // Replace with the desired phone number.
            ),
          ); // This trailing comma makes auto-formatting nicer for build methods.
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey, // Customize the color of the divider if needed
            thickness: 1.0, // Customize the thickness of the divider if needed
          );
        },
        itemCount: 10,
      ),
    );
  }
}
