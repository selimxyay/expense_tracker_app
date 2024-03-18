import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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