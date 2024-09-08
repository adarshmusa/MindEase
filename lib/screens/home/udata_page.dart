import 'package:companion_app/models/udata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:companion_app/screens/home/udata_list.dart';
import 'package:companion_app/models/auser.dart';
import 'package:companion_app/services/database.dart';

class UdataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auser? currentUser = Provider.of<Auser?>(context);
    final String uid = currentUser?.uid ?? '';

    return StreamProvider<List<Udata>>.value(
      initialData: [],
      value: DatabaseService(uid: uid).udata,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Friend Suggestions',
                style: TextStyle(
                  fontFamily: 'FontMainHeavy',
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: UdataList(),
      ),
    );
  }
}
