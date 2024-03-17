// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;

  const CategoryButton({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, [text, icon]);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: color.withAlpha(40),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(icon, color: color),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
