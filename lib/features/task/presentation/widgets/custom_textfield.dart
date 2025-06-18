import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _textController = TextEditingController();
  String _inputText = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration:  BoxDecoration(
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
      child: TextField(
        maxLines: 1,
        controller: _textController,
        onChanged: (value) {
          setState(() {
            _inputText = value;
          });
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: (){
              _textController.clear();
            },
            icon: Icon(Icons.clear),
          ),
          labelText: "Project Name",
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
          border: InputBorder.none,
          hintText: 'Enter text here',
          hintStyle: TextStyle(
            fontSize: 16,
              color: Colors.grey[600]
          ),
        ),

        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
      ),

      )
    );
  }
}