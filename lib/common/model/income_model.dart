import 'package:flutter/cupertino.dart';

class Income {
  final String incomeId;
  final double income;
  final String description;
  final DateTime date;
  final String category;
  final IconData icon;
  final bool isIncome;

  Income({
    required this.incomeId,
    required this.income,
    required this.description,
    required this.date,
    required this.category,
    required this.icon,
    required this.isIncome,
  });
}
