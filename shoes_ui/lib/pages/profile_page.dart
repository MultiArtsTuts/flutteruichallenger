import 'package:flutter/material.dart';
import 'package:shoes_ui/components/bottom_curved_nav.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: Text("Profile page"),
      ),
    );
  }
}