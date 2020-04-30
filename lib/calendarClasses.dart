

import 'package:flutter/material.dart';


class DayTileContainer extends StatelessWidget {
  final DateTime dateTime;
  final bool isDayOfCurrentMonth;
  final List<String> events;
  final Function markBuilder;
  final double borderRadius;
  final double dayTileMargin;
  final Function onTap;
  final bool isSelected;
  final Color dayTileBorderColor;
  final Function dayTileBuilder;
  final bool showBorder;

  DayTileContainer({
    this.dateTime,
    this.isDayOfCurrentMonth,
    this.events,
    this.markBuilder,
    this.borderRadius,
    this.dayTileMargin,
    this.onTap,
    this.isSelected,
    this.dayTileBorderColor,
    this.dayTileBuilder,
    this.showBorder,
  });

  @override
  Widget build(BuildContext context) {
    DayProps dayProps = DayProps(
      dateTime: dateTime,
      onTap: onTap,
      isDayOfCurrentMonth: isDayOfCurrentMonth,
      events: events,
      markBuilder: markBuilder,
      borderRadius: borderRadius,
      dayTileMargin: dayTileMargin,
      isSelected: isSelected,
      dayTileBorderColor: dayTileBorderColor,
      showBorder: showBorder,
      isToday: formatDate(dateTime) == formatDate(DateTime.now()),
    );
    return Expanded(
      child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap(dateTime, !isSelected);
            }
          },
          onLongPress: () {},
          child: Container(
            width: double.infinity,
            child: dayTileBuilder != null
                ? dayTileBuilder(dayProps)
                : _DayTile(dayProps),
          )),
    );
  }
}

class DayProps {
  final DateTime dateTime;
  final bool isDayOfCurrentMonth;
  final List<String> events;
  final Function markBuilder;
  final double borderRadius;
  final double dayTileMargin;
  final Function onTap;
  final bool isSelected;
  final Color dayTileBorderColor;
  final bool showBorder;
  final bool isToday;

  DayProps({
    this.dateTime,
    this.isDayOfCurrentMonth,
    this.events,
    this.markBuilder,
    this.borderRadius,
    this.dayTileMargin,
    this.onTap,
    this.isSelected,
    this.dayTileBorderColor,
    this.showBorder,
    this.isToday,
  });
}

class _DayTile extends StatelessWidget {
  final DayProps props;

  _DayTile(this.props);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(props.dayTileMargin ?? 3),
      decoration: BoxDecoration(
          border: props.showBorder == true
              ? Border.all(
            width: 1,
            color: props.dayTileBorderColor ?? Colors.grey,
          )
              : null,
          borderRadius: BorderRadius.circular(props.borderRadius),
          color: props.isSelected
              ? Theme.of(context).primaryColor
              : props.isToday
              ? Theme.of(context).primaryColorLight
              : Colors.transparent),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '${props.dateTime.day}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: props.isDayOfCurrentMonth
                        ? Colors.black87
                        : Colors.grey),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _EventMarks(props.events, markBuilder: props.markBuilder),
          ),
        ],
      ),
    );
  }
}

class _EventMarks extends StatelessWidget {
  final List<String> events;
  final Function markBuilder;

  _EventMarks(this.events, {this.markBuilder});

  @override
  Widget build(BuildContext context) {
    if (events == null) {
      return Container();
    }

    if (events.length == 0) {
      return Container();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(events.length, (index) {
        if (this.markBuilder != null) {
          return this.markBuilder(events[index]);
        }

        return _EventMark(Colors.black);
      }),
    );
  }
}

class _EventMark extends StatelessWidget {
  final Color color;

  _EventMark(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Container(
        width: 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 1),
        color: color,
      ),
    );
  }
}

String formatDate(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  return '${date.year}-$month-$day';
}