import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(
          icon,
          size: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}
