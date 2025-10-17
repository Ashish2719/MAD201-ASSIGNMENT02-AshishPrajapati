import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'add_expense_screen.dart';
import 'expense_detail_screen.dart';

/// Displays all expenses and navigates to AddExpense and Detail screens.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> _expenses = [];

  void _addNewExpense() async {
    final newExpense = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddExpenseScreen()),
    );
    if (newExpense != null) {
      setState(() => _expenses.add(newExpense));
    }
  }

  void _viewExpenseDetail(Expense expense) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpenseDetailScreen(expense: expense),
      ),
    );
  }

  double get totalExpense =>
      _expenses.fold(0.0, (sum, item) => sum + item.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Expenses')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${totalExpense.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return ListTile(
                  title: Text(expense.title),
                  subtitle: Text(expense.date.toString().split(' ')[0]),
                  trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
                  onTap: () => _viewExpenseDetail(expense),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addNewExpense,
      ),
    );
  }
}
