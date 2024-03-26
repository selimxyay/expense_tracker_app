import 'package:flutter/material.dart';

import '../model/expense_model.dart';

class ExpensesContainer extends StatelessWidget {
  const ExpensesContainer(this.expense, {super.key});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card( 
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              
              // Expense title

              Text(expense.title),

              const SizedBox(height: 8),

              // Expense amount, Category and Date

              Row(
                children: [
                  // type of amount is double
                    // toStringAsFixed specifies a fixed number of decimal 
                  Text('\$${expense.amount.toStringAsFixed(2)}'), // e.g., 12.21
                  const Spacer(),
                  
                  // This is the Row inside Row
                    // It's for displaying the category and date

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
      ),
    );
  }
}