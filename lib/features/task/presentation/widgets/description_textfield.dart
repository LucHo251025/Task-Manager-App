import 'package:flutter/material.dart';

class DescriptionTextField extends StatefulWidget {
  // final String? initialValue;
  // final ValueChanged<String>? onChanged;
  //
  // const DescriptionTextField({
  //   Key? key,
  //   this.initialValue,
  //   this.onChanged,
  // }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
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
            labelText: "Description",
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