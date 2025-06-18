import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateCard({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurpleAccent : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow:[
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getMonthName(date),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              date.day.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              _getWeekday(date),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getMonthName(DateTime date) {
  return [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ][date.month];
}

String _getWeekday(DateTime date) {
  return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][date.weekday % 7];
}
