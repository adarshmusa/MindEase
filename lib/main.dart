import 'package:companion_app/screens/wrapper.dart';
import 'package:companion_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:companion_app/models/auser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Auser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'FontMain'),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

