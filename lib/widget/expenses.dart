import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:statements/widget/chart/chart.dart';
import 'package:statements/widget/expenses_list/expenses_list.dart';
import 'package:statements/models/expense.dart';
import 'package:statements/widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense,),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: const Text('Statement deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      )
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: Text('No statements found.',style: GoogleFonts.inter(color: const Color.fromARGB(255, 108, 108, 108)),),
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('St.',
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 68, 68, 68),
            fontWeight: FontWeight.bold,
          ),  
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add)
          ),
        ]
      ),
      body: width < 600 ?
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded (
            child: mainContent,
          ),
        ],
      )
      :Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Chart(
              expenses: _registeredExpenses
            )
          ),
          Expanded (
            child: mainContent,
          ),
        ],
      )
    );
  }
}