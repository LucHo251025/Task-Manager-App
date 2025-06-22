import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/presentation/widgets/date_card.dart';

class HorizontalDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const HorizontalDatePicker({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

 @override
  State<StatefulWidget> createState() => _HorizontalDatePickerState();
}

class _HorizontalDatePickerState extends State<HorizontalDatePicker> {
  late DateTime selectedDate;
  late List<DateTime> dateList ;
  late ScrollController _scrollController;
  final double _itemWidth = 80.0;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    dateList = List.generate(15, (index) {
      return widget.initialDate.subtract(Duration(days: 7)).add(Duration(days: index));
    });

    _scrollController = ScrollController(
      initialScrollOffset: 7 * _itemWidth,
    );

    _scrollController.addListener(_onScroll);


  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void _onScroll() {
    if (_scrollController.offset <= 0) {
      _prependPastDates();
    } else if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _appendFutureDates();
    }
  }
  void _prependPastDates() {
    final firstDate = dateList.first;
    final newDates = List.generate(10, (i) => firstDate.subtract(Duration(days: 10 - i)));

    setState(() {
      dateList.insertAll(0, newDates);
    });

    // Giữ nguyên vị trí sau khi chèn (vì thêm phía trước)
    _scrollController.jumpTo(_scrollController.offset + newDates.length * _itemWidth);
  }

  void _appendFutureDates() {
    final lastDate = dateList.last;
    final newDates = List.generate(10, (i) => lastDate.add(Duration(days: i + 1)));

    setState(() {
      dateList.addAll(newDates);
    });
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }



  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 120,
      child: ListView.builder(
        controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: dateList.length,
          itemBuilder: (context, index) {
            final date =dateList[index];
            return DateCard(
                date: date,
                isSelected: date.day == selectedDate.day &&
                    date.month == selectedDate.month &&
                    date.year == selectedDate.year,
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                  widget.onDateSelected(date);
                }
            );
          }
      ),
    );
  }
}