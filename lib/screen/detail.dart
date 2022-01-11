// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:traviling/model/data.dart';

class Details extends StatelessWidget {
  static const String id = 'Details';

  final Function _avaibleFavirate;
  final Function isFavirate;
  Details(this._avaibleFavirate, this.isFavirate);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.arguments as String;
    final select = Trips_data.firstWhere((trip) => trip.id == route);
    return Scaffold(
      appBar: AppBar(
        title: Text('االتفاصــيل'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    child: Image.network(
                      select.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    height: 300,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
            _newMethod('الانشطة'),
            newContainer(
              ListView.builder(
                  // shrinkWrap: true,
                  itemCount: select.activities.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        child: Text(
                          select.activities[index],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            _newMethod('البرنامج اليومي'),
            newContainer(ListView.builder(
                itemCount: select.program.length,
                itemBuilder: (context, x) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Text('يوم ${x + 1}', style: styles),
                    ),
                    title: Text(
                      select.program[x],
                      style: styles,
                    ),
                  );
                }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _avaibleFavirate(route);
        },
        child: Icon(isFavirate(route) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Container newContainer(Widget child) {
    return Container(
      height: 200,
      //   padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo, width: 3),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  Container _newMethod(String txt) {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          txt,
          style: const TextStyle(
              fontSize: 30, color: Colors.indigo, fontWeight: FontWeight.bold),
        ));
  }

  TextStyle styles =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
}
