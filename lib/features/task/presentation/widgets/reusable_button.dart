import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const ReusableButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6C3BEF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
            elevation: 8.0,
            shadowColor: Colors.black.withOpacity(0.5)),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text, // Sử dụng text được truyền vào
              style: TextStyle(
                color: Colors.white, // Màu chữ trắng tinh khiết
                fontSize: 25.0, // Kích thước chữ to hơn
                fontWeight: FontWeight.bold, // Chữ đậm
              ),
            ),
            SizedBox(width: 20),
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white, // Màu trắng cho icon
                size: 24.0,
              ),
              SizedBox(width: 8.0), // Khoảng cách giữa icon và chữ
            ],
          ],
        ));
  }
}
