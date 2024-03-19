import 'package:flutter/material.dart';

import '../model/expense_model.dart';

class ExpensesContainer extends StatelessWidget {
  const ExpensesContainer(this.expense, {super.key});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card( 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                // type of amount is double
                  // toStringAsFixed specifies a fixed number of decimal 
                Text('\$${expense.amount.toStringAsFixed(2)}'), // e.g., 12.21
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}