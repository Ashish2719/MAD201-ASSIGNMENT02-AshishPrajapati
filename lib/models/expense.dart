// Course: MAD201
// Assignment 2
// Name: [Your Name]
// ID: [Your ID]
// Description: Defines the Expense model for storing expense data.

class Expense {
  final String title;
  final double amount;
  final String description;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.description,
    required this.date,
  });
}
