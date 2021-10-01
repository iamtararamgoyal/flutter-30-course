import 'package:flutter/material.dart';
import 'package:flutter_hello/widget/drawer.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "Goyal sir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Hello This is my $days days course by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
