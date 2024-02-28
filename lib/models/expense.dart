import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();
const uuid = Uuid();

enum Category {
  education,
  work,
  food,
  entertainment,
  health, 
  travel, 
  utilities,
  shopping, 
  hobbies,
  other
}

const categoryIcons = {
  Category.education: Icons.menu_book,
  Category.work: Icons.work,
  Category.food: Icons.local_dining,
  Category.entertainment: Icons.live_tv,
  Category.health: Icons.monitor_heart,
  Category.travel: Icons.airport_shuttle,
  Category.utilities: Icons.cottage,
  Category.shopping: Icons.shopping_cart,
  Category.hobbies: Icons.sports_esports,
  Category.other: Icons.more_horiz
};

class Expense{ 
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; 

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket{
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : 
    expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for(final expense in expenses){
      sum += expense.amount;
    }
    return sum;
  }

  
}