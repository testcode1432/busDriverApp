import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CargioCalender extends StatefulWidget {
  CargioCalender({
    super.key,
    required this.calendarBuilders,
    this.showPreviousDays,
    DateTime? firstDay,
    DateTime? lastDay,
    bool this.ontapDisable = false,
    DateTime? focusedDay,
    ValueChanged<DateTime>? onDaySelected,
    ValueChanged<List<DateTime?>>? onRangeSelected,
    required DateTime? selectedDate,
    DateTime? rangeStartDay,
    RangeSelectionMode rangeSelectionMode = RangeSelectionMode.disabled,
    DateTime? rangeEndDay,
  })  : _selectedDate = selectedDate,
        _rangeStartDay = rangeStartDay,
        _rangeEndDay = rangeEndDay,
        _rangeSelectionMode = rangeSelectionMode,
        _onDaySelected = onDaySelected,
        _onRangeSelected = onRangeSelected,
        _firstDay = firstDay,
        _lastDay = lastDay,
        _focusedDay = focusedDay;

  DateTime? _selectedDate;
  bool? ontapDisable;
  final DateTime? _firstDay;
  DateTime? _focusedDay;
  final DateTime? _lastDay;
  RangeSelectionMode _rangeSelectionMode;
  DateTime? _rangeStartDay;
  DateTime? _rangeEndDay;
  final CalendarBuilders<dynamic> calendarBuilders;
  final ValueChanged<DateTime>? _onDaySelected;
  final ValueChanged<List<DateTime?>>? _onRangeSelected;
  final bool? showPreviousDays;
  @override
  State<CargioCalender> createState() => _CargioCalenderState();
}

class _CargioCalenderState extends State<CargioCalender> {
  @override
  void initState() {
    widget._focusedDay == null ? widget._focusedDay = DateTime.now() : null;
    // TODO: implement initState
    super.initState();
  }

  var _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onPageChanged: (focusedDay) {
        widget._focusedDay = focusedDay;
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      enabledDayPredicate: (day) {
        // Enable all days if showPreviousDays is true
        if (widget.showPreviousDays ?? false) {
          return true;
        } else {
          // Disable only previous days if showPreviousDays is false
          return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
        }
      },
      availableGestures: AvailableGestures.none,
      firstDay: widget._firstDay ?? DateTime.utc(2010, 10, 16),
      lastDay: widget._lastDay ?? DateTime.utc(2030, 3, 14),
      focusedDay: widget._focusedDay ?? DateTime.now(),
      headerVisible: false,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      currentDay: widget._selectedDate,
      pageJumpingEnabled: false,
      availableCalendarFormats: const {
        CalendarFormat.month: 'month',
      },
      calendarStyle: const CalendarStyle(outsideDaysVisible: false),
      calendarBuilders: widget.calendarBuilders,
      onDaySelected: (selectedDay, focusedDay) {
        widget.ontapDisable ?? false
            ? null
            : setState(() {
                if (widget._onDaySelected != null) {
                  widget._onDaySelected!(selectedDay);
                  _selectedDay = selectedDay;
                  widget._focusedDay = focusedDay;
                }

                // widget._selectedDate = focusedDay;
                widget._selectedDate = selectedDay;
              });
      },
      rangeSelectionMode: widget._rangeSelectionMode,
      onRangeSelected: (start, end, focusedDay) {
        setState(() {
          widget._onRangeSelected!([start, end]);
          widget._rangeStartDay = start;
          widget._rangeEndDay = end;
        });
      },
      rangeStartDay:
          // DateTime.now()
          widget._rangeStartDay,
      rangeEndDay:
          //  DateTime.now().add(Duration(days: 3))
          widget._rangeEndDay,
      weekendDays: const [DateTime.sunday],
      calendarFormat: _calendarFormat,
      headerStyle: HeaderStyle(
        formatButtonTextStyle: const TextStyle().copyWith(
          color: Colors.white,
          fontSize: 15.0,
        ),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(16.0),
        ),
        titleCentered: true,
      ),
    );
  }
}
