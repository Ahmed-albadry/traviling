// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, dead_code, file_names

import 'package:flutter/material.dart';
import 'package:traviling/model/tripData.dart';
import 'package:traviling/screen/detail.dart';

class DesignDTrips extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final int duration;
  final Season season;
  final TripType tripType;
  DesignDTrips(
    this.id,
    this.image,
    this.title,
    this.duration,
    this.season,
    this.tripType,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.pink,
      onTap: () => _go(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                      borderRadius: BorderRadius.circular(15)),
                  height: 250,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  newMethod(Icons.today, '$duration ايام'),
                  newMethod(Icons.wb_sunny, '$seasonText '),
                  newMethod(Icons.family_restroom, '$tripText ')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _go(context) {
    Navigator.of(context).pushNamed(Details.id, arguments: id);
  }

  Row newMethod(IconData icon, String name) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.orange,
        ),
        SizedBox(
          width: 10,
        ),
        Text(name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ],
    );
  }

  String get seasonText {
    if (season == Season.Winter) {
      return 'شتاء';
    }
    if (season == Season.Summer) {
      return 'صيف';
    }
    if (season == Season.Autumn) {
      return 'خريف';
    }
    if (season == Season.Spring) {
      return 'ربيع';
    }

    return 'no';
  }

  String get tripText {
    switch (tripType) {
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
    }
  }
}
