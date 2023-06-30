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
    //Jalali jalaliDate = Jalali.fromDateTime(currentDate);
      //Jalali jalaliDate = Jalali(1400, 4, 9);
      
     /////
    

      //int month = jalaliDate.month;

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


  //Jalali jalaliDate = Jalali(1400, 4, 9);
  //nt month = jalaliDate.month;
//String monthName = persianMonthNames[month];



// نام ماه: تیر



    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  currentDate = currentDate.subtract(Duration(days: 31));
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
                  currentDate = currentDate.add(Duration(days: 31));
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
          buildCalendarCell('دوشنبه'),
          buildCalendarCell('سه‌شنبه'),
          buildCalendarCell('چهارشنبه'),
          buildCalendarCell('پنجشنبه'),
          buildCalendarCell('جمعه'),
          buildCalendarCell('شنبه'),
          buildCalendarCell('یکشنبه'),
        ],
      ),
    );

    // Calculate the start and end dates for the current month
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    DateTime lastDayOfMonth =
        DateTime(currentDate.year, currentDate.month + 1, 0);

    // Calculate the number of rows needed to display the month
    int numRows = ((firstDayOfMonth.weekday + lastDayOfMonth.day) / 7).ceil();

    // Loop through the rows
    for (int row = 0; row < numRows; row++) {
      List<Widget> cells = [];

      // Loop through the days of the week
      for (int day = 1; day <= 7; day++) {
        int dayOfMonth = (row * 7) + day - firstDayOfMonth.weekday;

        // Check if the current day is within the month range
        if (dayOfMonth >= 1 && dayOfMonth <= lastDayOfMonth.day) {
          cells.add(buildCalendarCell(dayOfMonth.toString()));
        } else {
          cells.add(Container()); // Empty cell for days outside the month
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

  Widget buildCalendarCell(String text) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Text(text),
    );
  }
}
//   List<TableRow> buildCalendarTable() {
    
//     List<TableRow> tableRows = [];

//     // Add header row for days of the week
//     tableRows.add(
//       TableRow(
//         children: [
//           // buildCalendarCell('Mon'),
//           // buildCalendarCell('Tue'),
//           // buildCalendarCell('Wed'),
//           // buildCalendarCell('Thu'),
//           // buildCalendarCell('Fri'),
//           // buildCalendarCell('Sat'),
//           // buildCalendarCell('Sun'),
//       buildCalendarCell('دوشنبه'),
//       buildCalendarCell('سه‌شنبه'),
//       buildCalendarCell('چهارشنبه'),
//       buildCalendarCell('پنجشنبه'),
//       buildCalendarCell('جمعه'),
//       buildCalendarCell('شنبه'),
//       buildCalendarCell('یکشنبه'),
//         ],
//       ),
//     );

//     // Calculate the start and end dates for the current month
//     DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
//     DateTime lastDayOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0);

//     // Calculate the number of rows needed to display the month
//     int numRows = ((firstDayOfMonth.weekday + lastDayOfMonth.day) / 7).ceil();

//     // Loop through the rows
//     for (int row = 0; row < numRows; row++) {
//       List<Widget> cells = [];

//       // Loop through the days of the week
//       for (int day = 1; day <= 7; day++) {
//         int dayOfMonth = (row * 7) + day - firstDayOfMonth.weekday;

//         // Check if the current day is within the month range
//         if (dayOfMonth >= 1 && dayOfMonth <= lastDayOfMonth.day) {
//           cells.add(buildCalendarCell(dayOfMonth.toString()));
//         } else {
//           cells.add(Container()); // Empty cell for days outside the month
//         }
//       }

//       tableRows.add(
//         TableRow(
//           children: cells,
//         ),
//       );
//     }

//     return tableRows;
//   }

  // Widget buildCalendarCell(String text) {
  //   return Container(
  //     height: 40,
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey),
  //     ),
  //     child: Text(text),
  //   );
  // }
//}

