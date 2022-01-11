// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traviling/design/designTrip.dart';

import 'tripData.dart';

class Favirate extends StatelessWidget {
  static const String id = 'Favirate';
  final List<Trip> avaibleFavirate;
  Favirate(this.avaibleFavirate);

  @override
  Widget build(BuildContext context) {
    if (avaibleFavirate.isEmpty) {
      return Center(
          child: Text(
        'لا يوجد شي في المفضلة',
        style: const TextStyle(fontSize: 25, color: Colors.black),
      ));
    } else {
      return ListView.builder(
          padding: EdgeInsets.all(10),
          //   shrinkWrap: true,
          itemCount: avaibleFavirate.length,
          itemBuilder: (context, index) {
            return DesignDTrips(
                avaibleFavirate[index].id,
                avaibleFavirate[index].imageUrl,
                avaibleFavirate[index].title,
                avaibleFavirate[index].duration,
                avaibleFavirate[index].season,
                avaibleFavirate[index].tripType);
          });
    }
  }
}
