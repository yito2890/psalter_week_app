

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class MyAppLocalizations {
  MyAppLocalizations(this.locale);

  final Locale locale;

  static MyAppLocalizations of(BuildContext context) {
    return Localizations.of<MyAppLocalizations>(context, MyAppLocalizations);
  }

  //Introduce multi-language words
  static Map<String, Map<String, String>> _localizedValues = {
    //English
    'en': {
      'advent': 'Advent',
      'christmas': 'Christmas',
      'day': 'Day',
      'easter': 'Easter',
      'friday': 'Friday',
      'lent': 'Lent',
      'liturgy': 'Liturgy',
      'monday': 'Monday',
      'month': 'Month',
      'octave': 'Octave',
      'ordinaryTime': 'Ordinary Time',
      'pentecost': 'Pentecost',
      'psalter': 'Psalter',
      'saturday': 'Saturday',
      'sunday': 'Sunday',
      'thursday': 'Thursday',
      'title': 'Title',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'week': 'Week',
    },

    //Español
    'es': {
      'advent': 'Adviento',
      'christmas': 'Navidad',
      'day': 'Día',
      'easter': 'Pascua',
      'friday': 'Viernes',
      'lent': 'Cuaresma',
      'liturgy': 'Liturgia',
      'monday': 'Lunes',
      'month': 'Mes',
      'octave': 'Octava',
      'ordinaryTime': 'Tiempo Ordinario',
      'pentecost': 'Pentecostés',
      'psalter': 'Salterio',
      'saturday': 'Sábado',
      'sunday': 'Domingo',
      'thursday': 'Jueves',
      'title': 'Título',
      'tuesday': 'Martes',
      'wednesday': 'Miércoles',
      'week': 'Semana',
    },
  };

  //Getters for multilanguage Strings
  String get advent {return _localizedValues[locale.languageCode]['advent'];}
  String get christmas {return _localizedValues[locale.languageCode]['christmas'];}
  String get day {return _localizedValues[locale.languageCode]['day'];}
  String get easter {return _localizedValues[locale.languageCode]['easter'];}
  String get friday {return _localizedValues[locale.languageCode]['friday'];}
  String get lent {return _localizedValues[locale.languageCode]['lent'];}
  String get liturgy {return _localizedValues[locale.languageCode]['liturgy'];}
  String get monday {return _localizedValues[locale.languageCode]['monday'];}
  String get month {return _localizedValues[locale.languageCode]['month'];}
  String get octave {return _localizedValues[locale.languageCode]['octave'];}
  String get ordinaryTime {return _localizedValues[locale.languageCode]['ordinaryTime'];}
  String get pentecost {return _localizedValues[locale.languageCode]['pentecost'];}
  String get psalter {return _localizedValues[locale.languageCode]['psalter'];}
  String get saturday {return _localizedValues[locale.languageCode]['saturday'];}
  String get sunday {return _localizedValues[locale.languageCode]['sunday'];}
  String get thursday {return _localizedValues[locale.languageCode]['thursday'];}
  String get title {return _localizedValues[locale.languageCode]['title'];}
  String get tuesday {return _localizedValues[locale.languageCode]['tuesday'];}
  String get wednesday {return _localizedValues[locale.languageCode]['wednesday'];}
  String get week {return _localizedValues[locale.languageCode]['week'];}


}

class DemoLocalizationsDelegate extends LocalizationsDelegate<MyAppLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<MyAppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<MyAppLocalizations>(MyAppLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}