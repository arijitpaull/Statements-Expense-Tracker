import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:statements/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20 ,
          vertical: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: GoogleFonts.inter(fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Row(
              children: [
                Text('Rs. ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formattedDate)
                  ],
                )
              ],)
          ]),
      )
    );
  }
}