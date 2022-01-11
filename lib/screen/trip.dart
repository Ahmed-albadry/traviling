// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traviling/design/designTrip.dart';
import 'package:traviling/model/tripData.dart';

class Trips extends StatelessWidget {
  static const String id = 'Trips';
  final List<Trip> avalibleFilter;

  const Trips(this.avalibleFilter);

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = route['id'];
    final name = route['name'];
    final filt =
        avalibleFilter.where((trip) => trip.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          //   shrinkWrap: true,
          itemCount: filt.length,
          itemBuilder: (context, index) {
            return DesignDTrips(
                filt[index].id,
                filt[index].imageUrl,
                filt[index].title,
                filt[index].duration,
                filt[index].season,
                filt[index].tripType);
          }),
    );
  }
}
