import 'package:flutter/material.dart';

import '../components/add_expense.dart';
import '../components/expenses_list.dart';
import '../model/expense_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of expense model must be created
  // because multiple expense model object instances will be created
  List<ExpenseModel> registeredExpenses = [
    ExpenseModel(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      title: "Cinema",
      amount: 8.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
 
  // Plus(+) icon at the right of appBar
  void addExpense() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const AddExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(onPressed: addExpense, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(
              expenses: registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
