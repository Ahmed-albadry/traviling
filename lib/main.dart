// ignore_for_file: unused_field, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:traviling/model/data.dart';
import 'package:traviling/model/tripData.dart';
import 'l10n/l10n.dart';
import 'model/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model/filter.dart';
import 'model/tabs.dart';
import 'screen/detail.dart';
import 'screen/home.dart';
import 'screen/trip.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fillter = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> avalibleFilter = Trips_data;
  List<Trip> avaibleFavirate = [];

  _saveFillter(Map<String, bool> filterData) {
    setState(() {
      _fillter = filterData;
      avalibleFilter = Trips_data.where((trip) {
        if (_fillter['summer'] == true && trip.isInSummer == false) {
          return false;
        }
        if (_fillter['winter'] == true && trip.isInWinter == false) {
          return false;
        }
        if (_fillter['family'] == true && trip.isForFamilies == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  _saveFavirate(String tripId) {
    var exist = avaibleFavirate.indexWhere((trip) => trip.id == tripId);
    if (exist >= 0) {
      setState(() {
        avaibleFavirate.removeAt(exist);
      });
    } else {
      setState(() {
        avaibleFavirate.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool isFavirate(String id) {
    return avaibleFavirate.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocalPorvider(),
        builder: (context, child) {
          final provider = Provider.of<LocalPorvider>(context);

          return MaterialApp(
            locale: provider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            //   home: const Local(),
            initialRoute: Tabs.id,
            routes: {
              '/': (_) => Tabs(avaibleFavirate),
              Fillter.id: (_) => Fillter(_fillter, _saveFillter),
              HomePage.id: (_) => HomePage(),
              Trips.id: (_) => Trips(avalibleFilter),
              Details.id: (_) => Details(_saveFavirate, isFavirate)
            },
          );
        });
  }
}
