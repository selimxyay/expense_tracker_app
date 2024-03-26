import 'package:flutter/material.dart';

import '../chart/chart.dart';
import '../components/add_expense.dart';
import '../components/expenses_list.dart';
import '../model/expense_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // with List<ExpenseModel>, we're telling that
  // This list can only hold ExpenseModel objects.
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

  // after used clicked on the "save" button, this method will execute
  void _addTheNewExpenseToList(ExpenseModel expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  // Plus(+) icon at the right of appBar
  void addExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
        // isScrollControlled: true, // it will take all the available height
        context: context,
        builder: (ctx) => AddExpense(
              onAddExpense: _addTheNewExpenseToList,
            ));
  }

  void _removeExpense(ExpenseModel expense) {
    final indexOfExpense = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.grey.shade100,
      content: const Text(
        "Expense is deleted.",
        style: TextStyle(color: Colors.black),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        textColor: Colors.black,
        label: "Undo",
        onPressed: () {
          setState(() {
            registeredExpenses.insert(indexOfExpense, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Stores the width of a screen
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(onPressed: addExpense, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: registeredExpenses),
                Expanded(
                    child: registeredExpenses.isNotEmpty
                        ? ExpensesList(
                            expenses: registeredExpenses,
                            onRemoveExpense: _removeExpense,
                          )
                        : const Center(
                            child: Text(
                              "There is no expense. Start adding some!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: registeredExpenses)),
                Expanded(
                    child: registeredExpenses.isNotEmpty
                        ? ExpensesList(
                            expenses: registeredExpenses,
                            onRemoveExpense: _removeExpense,
                          )
                        : const Center(
                            child: Text(
                              "There is no expense. Start adding some!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )),
              ],
            ),
    );
  }
}
