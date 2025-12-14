import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.text,
    required this.onPressHandler,
    this.icon,
    this.backgroundColor,
    this.contentColor,
  });

  String text;
  IconData? icon;
  int? backgroundColor;
  int? contentColor;
  Function onPressHandler;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressHandler();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Color(contentColor ?? 0xFFFFFFFF)),
              SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: Color(contentColor ?? 0xFFFFFFFF),
                fontSize: 18,
              ),
            ),
          ],
        ),

        decoration: BoxDecoration(
          color: Color(backgroundColor ?? 0xFF8A2BE2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
