import 'package:flutter/material.dart';
import 'package:flutter_hello/models/catlog.dart';
import 'package:flutter_hello/widgets/drawer.dart';
import 'package:flutter_hello/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "Goyal sir";
final dummyList = List.generate(50, (index) => CatlogModel.item[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index]
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
