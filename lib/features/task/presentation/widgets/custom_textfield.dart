import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _textController = TextEditingController();
  String _inputText = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _inputText = _textController.text;
      }); // cập nhật UI khi nội dung thay đổi
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration:  BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:  theme.colorScheme.outline,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: theme.colorScheme.outline,
          width: 1.5
        )
      ),

      child: TextField(
        maxLines: 1,
        controller: _textController,
        onChanged: (value) {
          setState(() {
            _inputText = value;
          });
        },
        decoration: InputDecoration(
          suffixIcon: _inputText.isNotEmpty ? IconButton(
            onPressed: (){
              _textController.clear();
            },
            icon: Icon(Icons.clear),
          ): null,
          labelText: "Project Name",
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
          border: InputBorder.none,
          hintText: 'Enter text here',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(
            fontSize: 16,
              color: Colors.grey[600]
          ),
        ),

        style: TextStyle(
          color:theme.colorScheme.onSecondary,
          fontSize: 16,
      ),

      )
    );
  }
}