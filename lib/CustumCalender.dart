import 'package:calender/Cell.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState get createState => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime currentDate;

  bool isSelected = false;


  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    
  }

  @override
  Widget build(BuildContext context) {

    List<String> persianMonthNames = [
    '',
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];
    Jalali jalaliDate = Jalali.fromDateTime(currentDate);
  int month = jalaliDate.month;
  String monthName = persianMonthNames[month];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  currentDate = currentDate.subtract(Duration(days: 30));
                });
              },
            ),
            Column(
              children: [

                Text(
            monthName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
                Text(
                  '${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  currentDate = currentDate.add(Duration(days: 30));
                });
              },
            ),
          ],
        ),
        Table(
          children: buildCalendarTable(),
        ),
      ],
    );
  }

  List<TableRow> buildCalendarTable() {
    List<TableRow> tableRows = [];

    // Add header row for days of the week
    tableRows.add(
      TableRow(
        children: [
          buildCell(text: 'شنبه'),
          buildCell(text: 'یکشنبه'),
          buildCell(text: 'دوشنبه'),
          buildCell(text: 'سه شنبه'),
          buildCell(text: 'چهارشنبه'),
          buildCell(text: 'پنجشنبه'),
          buildCell(text: 'جمعه'),
        ],
      ),
    );

    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    DateTime lastDayOfMonth =
        DateTime(currentDate.year, currentDate.month + 1, 0);


    int numRows = ((firstDayOfMonth.weekday + lastDayOfMonth.day) / 7).ceil();

    // Loop through the rows
    for (int row = 0; row < numRows; row++) {
      List<Widget> cells = [];

      // Loop through the days of the week
      for (int day = 1; day <= 7; day++) {
        int dayOfMonth = (row * 7) + day - firstDayOfMonth.weekday;

        
        if (dayOfMonth >= 1 && dayOfMonth <= lastDayOfMonth.day) {
          cells.add(buildCell(text: dayOfMonth.toString()));
        } else {
          cells.add(Container());
        }
      }
      tableRows.add(
        TableRow(
          children: cells,
        ),
      );
    }
    return tableRows;
  }
}

