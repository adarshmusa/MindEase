import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:companion_app/models/udata.dart';

class UdataTile extends StatelessWidget {
  final Udata udata;
  UdataTile({required this.udata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Stack(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                //backgroundColor: Colors.deepPurpleAccent[(udata.age)*5],
                backgroundColor: Colors.deepPurpleAccent[100],
                backgroundImage: NetworkImage('https://www.iconshock.com/3D/character/png/thumbnails/monster-freak-alien-giant-mythical_creature.webp'),
                //   child: Icon(
                //   Icons.person,
                //   color: Colors.white,
                // ),
              ),
              title: Text(udata.name, style: TextStyle( fontFamily: 'FontMainSemibold')),
              subtitle: Row(
                children: [
                  Text(udata.profession, style: TextStyle( fontFamily: 'FontMain')),
                  Text(', Mood Score ', style: TextStyle( fontFamily: 'FontMain')),
                  Text(udata.mood, style: TextStyle( fontFamily: 'FontMain')),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child:
                TextButton.icon(
                  onPressed:(){},
                  icon:Icon(CupertinoIcons.add, color: Colors.green, size: 30),
                  label:Text('')
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
