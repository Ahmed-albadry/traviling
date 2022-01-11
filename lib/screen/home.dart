// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:traviling/design/designHome.dart';
import 'package:traviling/model/data.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future refresh() async {
    setState(() {});
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 7 / 8),
            children: data
                .map((cat) => DesignHome(cat.id, cat.title, cat.imageUrl))
                .toList()));
  }
}
