import 'package:flutter/material.dart';
import 'package:flutter_localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      supportedLocales: [
        Locale('en', 'US'),
        Locale('sk', 'SK'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Localizations'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('first_string')),
            Text(AppLocalizations.of(context).translate('second_string')),
            Text('This will not be translated'),
          ],
        ),
      ),
    );
  }
}
