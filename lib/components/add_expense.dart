// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../model/expense_model.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  // Controller for displaying the expense title
  final _expenseTitleController = TextEditingController();

  // Controller for displaying the expense amount
  final _expenseAmountController = TextEditingController();

  // variable for displaying the date after user has selected
  DateTime? _selectedDate;

  
  @override
  void dispose() {
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  // This method will be executed, when user clicked on the date icon

  Future<void> _datePicker() async {

    // now represents the current time
    final now = DateTime.now();

    final firstSelectableDate = DateTime(now.year - 1, now.month, now.day);

    // showDatePicker is a window that allow you to choose a date
      // with await, it says: before setting the state of _selectedDate
        // wait for user to select a date

    final dateThatUserSelected = await showDatePicker( 
        context: context, 
        firstDate: firstSelectableDate, 
        lastDate: now
      );

    // If this method was not an async method,
      // code would try to access _selectedDate before user selected any date
        // because of that, async operation must be used
    setState(() {
      _selectedDate = dateThatUserSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [

          // Title

          TextField(
            controller: _expenseTitleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),

          // Amount & Date

          Row(
            children: [
              Expanded(
                // Amount
                child: TextField(
                  controller: _expenseAmountController,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text("Amount"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(

                // This is the Row inside Row for 
                // Date info(e.g., 01.01.2024) and Date icon

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    // Date

                    Text(_selectedDate == null
                        ? "No date selected"
                        : DateFormat.yMd().format(_selectedDate!)), // with !, it ensures that it's not gonna return null
                        
                    // Clickable Date icon 
                       
                    IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Category & Buttons

          Row(
            children: [
              DropdownButton(
                // In order to display each category
                  // map() is used to create a DropdownMenuItem for each category

                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          // items parameter requires a List
                            // this is why .toList() is used
                          child: Text(category.name))).toList(),

                  // a method will be executed when user selected an item
                  onChanged: (value) {
                    print(value);
                  }),

              const Spacer(), // buttons will move to the far right

              // Cancel & Save buttons

              TextButton(
                  // when it's pressed, it closes the current screen
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    print(_expenseTitleController.text);
                    print(_expenseAmountController.text);
                  },
                  child: const Text("Save")),
            ],
          ),
        ],
      ),
    );
  }
}
