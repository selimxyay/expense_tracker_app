import 'package:uuid/uuid.dart';

const uuid = Uuid(); // uuid for generating random ids

enum Category {
  food,
  travel,
  leisure,
  work
} // enum for creating custom types, to avoid typo

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
      : id = uuid.v4(); // initializer list in here

  final String id; // identify the expense
  final String title;
  final double amount;
  final DateTime date;
  final String category;
}
