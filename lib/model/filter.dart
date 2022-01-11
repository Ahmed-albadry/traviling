// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:traviling/model/tabs.dart';

class Fillter extends StatefulWidget {
  static const String id = 'Fillter';
  Map<String, bool> _fillter;
  final Function saveFillter;
  Fillter(this._fillter, this.saveFillter);

  @override
  State<Fillter> createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  var isSummer = false;
  var isWInter = false;
  var isFamily = false;
  @override
  void initState() {
    isSummer = widget._fillter['summer']!;
    isWInter = widget._fillter['winter']!;
    isFamily = widget._fillter['family']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawers(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          'الفلترة',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          _newMethod('الصيفية', 'اظهار رحلات الصيف فثط', isSummer, (newval) {
            setState(() {
              isSummer = newval;
            });
          }),
          SizedBox(
            height: 15,
          ),
          _newMethod('الشتوية', 'اظهار رحلات الشتاء فثط', isWInter, (newval) {
            setState(() {
              isWInter = newval;
            });
          }),
          SizedBox(
            height: 15,
          ),
          _newMethod('العائلية', 'اظهار رحلات العائلة فثط', isFamily, (newval) {
            setState(() {
              isFamily = newval;
            });
          }),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink)),
                onPressed: () {
                  final _fillter = {
                    'summer': isSummer,
                    'winter': isWInter,
                    'family': isFamily,
                  };
                  widget.saveFillter(_fillter);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      'حفظ',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  SwitchListTile _newMethod(
      String title, String subtitle, var value, Function(bool) chane) {
    return SwitchListTile(
        activeColor: Colors.pink,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        value: value,
        onChanged: chane);
  }
}
