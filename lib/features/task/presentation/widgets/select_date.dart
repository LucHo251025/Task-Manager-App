import 'package:flutter/material.dart';

class SelectDate extends StatefulWidget {
  final String? lable;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const SelectDate({
    Key? key,
    required this.lable,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  final _dateController = TextEditingController();
  late DateTime selectedDate;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
      isExpanded = false;
    });
    widget.onDateSelected(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a date';
            }
            return null;
          },
          controller: _dateController,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget.lable,
            prefixIcon: const Icon(Icons.calendar_month,
            size: 28, color:  Color(0xFF7A3FFF)),
            suffixIcon: Icon(
              isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 28,
            ),
            hintText: 'dd/mm/yyyy',
          ),
          readOnly: true,
          onTap: () async {
            setState(() {
              isExpanded = !isExpanded;
            });
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100));
            if (pickedDate != null) {
              String formattedDate =
                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              _dateController.text = formattedDate;
              _selectDate(pickedDate);
            }
          },
        ));
  }
}
