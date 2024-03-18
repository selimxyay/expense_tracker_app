import 'package:flutter/material.dart';

import '../model/expense_model.dart';
import 'expenses_container.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesContainer(
        expenses[index]
      ),
    );
  }
}