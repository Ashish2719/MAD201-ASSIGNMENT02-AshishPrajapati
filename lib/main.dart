import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

/// Main entry point for the Expense Tracker App.
void main() {
  runApp(ExpenseTrackerApp());
}

/// Root widget defining MaterialApp structure.
class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
