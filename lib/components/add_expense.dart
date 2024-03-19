// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../model/expense_model.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _expenseTitleController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  DateTime? _selectedDate;

  // ignore: annotate_overrides
  void dispose() {
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _expenseTitleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? "No date selected"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton(
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString())))
                      .toList(),
                  onChanged: (value) {
                    print(value);
                  }),
              TextButton(
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
