library kalendar;


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:date_utils/date_utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:psalterweekapp/appLocalizations.dart';
import 'package:psalterweekapp/shared.dart';
import 'package:psalterweekapp/calendarClasses.dart';

typedef ValueChanged<T> = void Function(T);
typedef MarkBuilder = Widget Function(String event);
typedef OnTappedOnDayTile = Widget Function(DateTime dateTime, bool isSelected);
typedef HeaderBuilder = Widget Function(
    DateTime dateTime, ValueChanged<DateTime> changedDateTime);
typedef DayTileBuilder = Widget Function(DayProps dayProps);
typedef WeekBuilder = Widget Function(List<String> weeks);



class DemoApp extends StatefulWidget {

  //Calendar definition
  final Map<String, List<String>> markedDates;
  final MarkBuilder markBuilder;
  final double borderRadius;
  final double dayTileMargin;
  final OnTappedOnDayTile onTap;
  final Set<String> selectedDates;
  final Color dayTileBorderColor;
  final DayTileBuilder dayTileBuilder;
  final WeekBuilder weekBuilder;
  final bool showBorder;
  final HeaderBuilder headerBuilder;

  DemoApp({
    this.markedDates,
    this.markBuilder,
    this.borderRadius,
    this.onTap,
    this.selectedDates,
    this.dayTileMargin,
    this.dayTileBorderColor,
    this.dayTileBuilder,
    this.weekBuilder,
    this.showBorder,
    this.headerBuilder,
  });

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  //Calendar State mod
  DateTime _visibleMonth;

  int _currentPageIndex = 999;
  PageController _pageController;

  _onPageChanged(pageIndex) {
    if (pageIndex > _currentPageIndex) {
      _visibleMonth = Utils.nextMonth(_visibleMonth);
    } else if (pageIndex < _currentPageIndex) {
      _visibleMonth = Utils.previousMonth(_visibleMonth);
    }

    setState(() {});

    _currentPageIndex = pageIndex;
  }

  void initState() {
    super.initState();
    _visibleMonth = Utils.firstDayOfMonth(DateTime.now());
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  void _changeMonth(date) {
    setState(() {
      _visibleMonth = date;
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(MyAppLocalizations.of(context).tuesday),
      ),
      body: Column(
        children: <Widget>[
          widget.headerBuilder != null
              ? widget.headerBuilder(_visibleMonth, _changeMonth)
              : _DefaultHeader(_visibleMonth, onChange: (date) {
            _changeMonth(date);
          }),
          widget.weekBuilder != null
              ? widget.weekBuilder(Utils.weekdays)
              : Container(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              children: List.generate(Utils.weekdays.length, (index) {
                return Expanded(
                  child: Text(
                    '${Utils.weekdays[index]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, pageIndex) {
                List<DateTime> days = Utils.daysInMonth(_visibleMonth);
                return GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7),
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DayTileContainer(
                            dateTime: days[index],
                            isDayOfCurrentMonth:
                            days[index].month == _visibleMonth.month,
                            events: widget.markedDates != null
                                ? widget.markedDates[formatDate(days[index])]
                                : null,
                            markBuilder: widget.markBuilder,
                            borderRadius: widget.borderRadius ?? 4,
                            dayTileMargin: widget.dayTileMargin,
                            onTap: widget.onTap,
                            isSelected: widget.selectedDates != null
                                ? widget.selectedDates
                                .contains(formatDate(days[index])) ??
                                false
                                : false,
                            dayTileBorderColor: widget.dayTileBorderColor,
                            dayTileBuilder: widget.dayTileBuilder,
                            showBorder: widget.showBorder,
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DefaultHeader extends StatelessWidget {
  final DateTime visibleMonth;
  final Function onChange;

  _DefaultHeader(this.visibleMonth, {this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              onChange(Utils.previousMonth(visibleMonth));
            },
          ),
          Text(
            '${Utils.formatMonth(visibleMonth)}',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              onChange(Utils.nextMonth(visibleMonth));
            },
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => MyAppLocalizations.of(context).title,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      // Watch out: MaterialApp creates a Localizations widget
      // with the specified delegates. DemoLocalizations.of()
      // will only find the app's Localizations widget if its
      // context is a child of the app.
      home: DemoApp(),
    );
  }
}

void main() {
  runApp(MyApp());
}