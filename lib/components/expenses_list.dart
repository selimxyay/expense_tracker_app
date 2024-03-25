import 'package:flutter/material.dart';

import '../model/expense_model.dart';
import 'expenses_container.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  // created a list called expenses
    // this list can only store the ExpenseModel Objects
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: Theme.of(context).colorScheme.error, ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpensesContainer(
          expenses[index] // index assigns a unique identifier to each item in the list. 
        ),
      ),
    );
  }
}