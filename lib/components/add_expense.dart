// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../model/expense_model.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseModel expense) onAddExpense; 

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

  // variable for category
  Category _selectedCategory = Category.leisure; 

  
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

  // When user clicked on the "Save" button, this method will be executed
    // Basically this method is checking if expense title, amount and date is selected or not
      // If it's not selected, it'll throw an error

  void _submitTheNewExpense() {
    // tryParse is used on strings 
      // it tries to convert those strings into double or integers
        // if it can not convert, it returns null
    final enteredAmount = double.tryParse(_expenseAmountController.text);

    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    final titleIsInvalid = _expenseTitleController.text.trim().isEmpty;
    final dateIsInvalid = _selectedDate == null;

    // In here, trim prevents empty submissions due to accidental whitespaces
    // This if statement check via bool values 
    if (titleIsInvalid || amountIsInvalid || dateIsInvalid) {
      /* 
      showDialog in Flutter displays a modal dialog on top of your app's content, pausing user interaction with the rest of the app until the dialog is dismissed.
      */
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text("Invalid Input!", style: TextStyle(fontWeight: FontWeight.bold),),
        content: const Text("Please make sure a valid title, amount, date and category was entered!"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(ctx);
          }, child: const Text("Okay")),
        ],
      ));
      // after showDialog, return keyword is used in order to not to return invalid data
      // basically we're saying "stop the execution of _submitTheNewExpense"
      // because we don't want to submit the data which contains invalid input
      return;
    } 
    widget.onAddExpense(ExpenseModel(title: _expenseTitleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
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
                  // keyboardType: TextInputType.numberWithOptions(decimal: true),
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
          const SizedBox(height: 40),
    
          // Category & Buttons
    
          Row(
            children: [
              DropdownButton(
                // value is the currently selected item
                value: _selectedCategory,
    
                // In order to display each category
                  // map() is used to create a DropdownMenuItem for each category
    
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          // items parameter requires a List
                            // this is why .toList() is used
                          child: Text(category.name.toUpperCase()))).toList(),
    
                  // a method that will execute whenever new item is selected
                    // In onChanged, value is the newly selected category in this context
    
                  onChanged: (value) {
                    // if user did not select anything, stop executing the rest of this method
                    if (value == null) {
                      return;
                    }
    
                    // when user select a category, assign it to _selectedCategory variable
                    setState(() {
                      _selectedCategory = value;
                    });
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
                  onPressed: _submitTheNewExpense,
                  child: const Text("Save")),
            ],
          ),
        ],
      ),
    );
  }
}
