import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: transaction.map((tx) {
          return Card(
            child: Container(
              color: Colors.greenAccent,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(color: Colors.blue)),
                    child: Center(
                      child: Text(
                        '\$${tx.amount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.greenAccent,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Text(tx.name),
                        SizedBox(height: 10),
                        Text(
                          DateFormat.yMMMEd().format(tx.date),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
