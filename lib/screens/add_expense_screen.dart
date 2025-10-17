import 'package:flutter/material.dart';
import '../models/expense.dart';

/// AddExpenseScreen allows user to input new expense details.
class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? selectedDate;

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) setState(() => selectedDate = pickedDate);
  }

  void _saveExpense() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        double.tryParse(_amountController.text) == null ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter all fields correctly')),
      );
      return;
    }

    final newExpense = Expense(
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      description: _descriptionController.text,
      date: selectedDate!,
    );
    Navigator.pop(context, newExpense);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Expense Title'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextButton(
              onPressed: _showDatePicker,
              child: Text(
                selectedDate == null ? 'Select Date' : selectedDate.toString(),
              ),
            ),
            ElevatedButton(onPressed: _saveExpense, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
