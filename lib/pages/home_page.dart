import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hello/models/catalog.dart';
import 'package:flutter_hello/widgets/drawer.dart';
import 'package:flutter_hello/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);
  }

  final dummyList = List.generate(50, (index) => CatalogModel.item[0]);

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
          return ItemWidget(item: dummyList[index]);
        },
      )),
      drawer: MyDrawer(),
    );
  }
}
