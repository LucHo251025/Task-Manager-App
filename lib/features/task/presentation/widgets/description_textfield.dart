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
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _inputText = _textController.text;
      }); // cập nhật UI khi nội dung thay đổi
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(2),
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
          maxLines: 5,
          controller: _textController,
          onChanged: (value) {
            setState(() {
              _inputText = value;
            });
          },
          decoration: InputDecoration(
            alignLabelWithHint: true,
            suffixIcon: _inputText.isNotEmpty ?
            IconButton(
              onPressed: (){
                _textController.clear();
                setState(() {
                  _inputText = '';
                });
              },
              icon: Icon(Icons.clear),
            ): null,
            labelText: "Description",
            labelStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
            border: InputBorder.none,
            hintText: 'Enter text here',
            floatingLabelBehavior: FloatingLabelBehavior.always,             hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey[600]
            ),
          ),

          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),

          keyboardType: TextInputType.text,
        )
    );
  }
}