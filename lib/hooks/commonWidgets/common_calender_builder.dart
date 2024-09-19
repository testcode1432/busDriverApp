
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarBuilders extends CalendarBuilders {
  CustomCalendarBuilders()
      : super(
          defaultBuilder: _defaultDayBuilder,
        );

  static Widget _defaultDayBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return _buildDayCell(day, focusedDay);
  }

  static Widget _buildDayCell(DateTime day, DateTime focusedDay) {
    if (day == focusedDay) {
      // Custom style for the currently focused day
      return Container(
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              day.day.toString(),
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      );
    } else {
      // Custom style for other days
      return Container(
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              day.day.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _isSunday(day) ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      );
    }
  }

  static List<String> _getEventsForDay(DateTime day) {
    // Example: Return a list of events based on the day
    if (day.day == 1) {
      return ['Holiday'];
    } else if (day.day == 15) {
      return ['Leave'];
    } else if (day.day == 10) {
      return ['Absent'];
    } else {
      return ["Present"];
    }
  }

  static bool _isSunday(DateTime day) {
    return day.weekday == DateTime.sunday;
  }

  static bool _isHoliday(DateTime day) {
    // Custom logic to determine if the day is a holiday
    // Example implementation:
    // return true if day is a holiday, false otherwise
    return false;
  }

  static bool _isPresent(DateTime day) {
    // Custom logic to determine if the day represents "present"
    // Example implementation:
    // return true if day is marked as "present", false otherwise
    return false;
  }

  static bool _isLeave(DateTime day) {
    // Custom logic to determine if the day represents "leave"
    // Example implementation:
    // return true if day is marked as "leave", false otherwise
    return false;
  }

  static bool _isAbsent(DateTime day) {
    // Custom logic to determine if the day represents "absent"
    // Example implementation:
    // return true if day is marked as "absent", false otherwise
    return false;
  }
}
