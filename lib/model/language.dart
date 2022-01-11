// ignore_for_file: prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traviling/l10n/l10n.dart';

class LocalPorvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;
  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalPorvider>(context);
    final locale = provider.locale ?? Locale('en');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locales) {
            final flag = L10n.getFlag(locales.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              value: locales,
              onTap: () {
                final provider =
                    Provider.of<LocalPorvider>(context, listen: false);

                provider.setLocale(locales);
              },
            );
          },
        ).toList(),
        onChanged: (newValue) {},
      ),
    );
  }
}
