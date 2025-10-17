// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/expense.dart';

/// Displays expense details passed from Home Screen.
class ExpenseDetailScreen extends StatelessWidget {
  final Expense expense;

  // ignore: prefer_const_constructors_in_immutables
  ExpenseDetailScreen({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${expense.title}', style: TextStyle(fontSize: 18)),
            Text(
              'Amount: \$${expense.amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Date: ${expense.date.toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(expense.description),
          ],
        ),
      ),
    );
  }
}
