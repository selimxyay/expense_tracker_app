import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// uuid is for generating random ids
const uuid = Uuid();

// enum is for creating custom types, for category names in this context, to avoid typo
enum Category { food, travel, leisure, work }

// matching category names with unique icons
const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
  Category.leisure: Icons.tv,
};

class ExpenseModel {
   
  // no constructor for id, an initializer list is used instead
  // because new id must be created every time new instance of object is created

  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); // v4 is used for creating unique string ids

  final String id; // id is created to each expense
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }
}
