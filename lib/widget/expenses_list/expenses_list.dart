import 'package:flutter/material.dart';
import 'package:statements/models/expense.dart';
import 'package:statements/widget/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;


  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(       
          color: Colors.red,
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          child: const Text(
            'DELETE',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Color.fromARGB(57, 255, 255, 255), 
              fontWeight: FontWeight.bold, 
              fontSize: 50,
            ),
           ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index])
      )
    );
  }
}