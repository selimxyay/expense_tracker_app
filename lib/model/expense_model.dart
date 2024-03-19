import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

/* uuid for generating random ids */
const uuid = Uuid();

/* enum for creating custom types, to avoid typo */
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
  Category.leisure: Icons.tv,
};

class ExpenseModel {
  /* 
  no constructor for id, initializer list is used instead
  because new id must be created every time new instance object is created
  so initializer list is used instead
  */
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); // initializer list

  final String id; // id is for identifying and locating the each expense
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
