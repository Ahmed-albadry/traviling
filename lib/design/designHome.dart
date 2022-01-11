// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traviling/screen/trip.dart';

class DesignHome extends StatelessWidget {
  final String id;
  final String name;
  final String image;
// ignore: use_key_in_widget_constructors
  DesignHome(this.id, this.name, this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.pink,
        onTap: () => _go(context),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 250,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }

  _go(context) {
    Navigator.of(context)
        .pushNamed(Trips.id, arguments: {'id': id, 'name': name});
  }
}
