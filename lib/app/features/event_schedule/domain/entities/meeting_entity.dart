import 'package:flutter/material.dart';

class Meeting {
  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
}
