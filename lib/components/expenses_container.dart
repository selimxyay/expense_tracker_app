import 'package:flutter/material.dart';

import '../model/expense_model.dart';

class ExpensesContainer extends StatelessWidget {
  const ExpensesContainer(this.expense, {super.key});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(expense.title),
    );
  }
}