import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("DashBord"),

      ),
      body: Container(
        alignment: Alignment.center,
        child:
    Text("Welcome to dashBoard")),);
  }
}
