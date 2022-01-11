// ignore_for_file: file_names

// ignore: constant_identifier_names
enum Season { Winter, Autumn, Summer, Spring }
// ignore: constant_identifier_names
enum TripType { Exploration, Activities, Recovery }

class Trip {
  final String id;
  final List categories;
  final String title;
  final String imageUrl;
  final List activities;
  final List program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  Trip(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.activities,
      required this.program,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
