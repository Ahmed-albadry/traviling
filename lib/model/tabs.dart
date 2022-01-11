// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:traviling/model/language.dart';
import 'package:traviling/model/tripData.dart';
import 'package:traviling/screen/home.dart';

import 'favirate.dart';
import 'filter.dart';

class Tabs extends StatefulWidget {
  static const String id = 'Tabs';

  final List<Trip> avaibleFavirate;
  Tabs(this.avaibleFavirate);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  void initState() {
    _screen = [
      {'screen': HomePage(), 'title': 'الرئسية', 'drawer': Drawers()},
      {
        'screen': Favirate(widget.avaibleFavirate),
        'title': 'المفضلة',
        'drawer': Drawers()
      }
    ];
    super.initState();
  }

  late List<Map> _screen;

  // HomePage(), Favirate()
  int number = 0;
  choose(int x) {
    setState(() {
      number = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _screen[number]['drawer'],
      appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          actions: [
            LanguagePickerWidget(),
          ],
          title: Text(
            _screen[number]['title'],
          )),
      body: _screen[number]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: number,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: choose,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: 'الرئسية'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'المفضلة')
        ],
      ),
    );
  }
}

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.pink),
            padding: EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'الســياحة',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            height: 100,
            width: double.infinity,
          ),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            color: Colors.indigo,
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: ListTile(
                leading: Icon(
                  Icons.card_travel,
                  color: Colors.white,
                ),
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'الـــرحلات',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Divider(
            color: Colors.black,
          ),
          MaterialButton(
            splashColor: Colors.amber,
            onPressed: () {
              Navigator.of(context).pushNamed(Fillter.id);
            },
            color: Colors.indigo,
            child: ListTile(
                leading: Icon(
                  Icons.list_alt,
                  color: Colors.white,
                ),
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'الفـــــــلترة',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
