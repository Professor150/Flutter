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
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'Not Transaction Added Yet',
                  style: Theme.of(context).textTheme.subtitle2,
                  // style: Theme.of(context).textTheme.subtitle2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  height: 200,
                  child: Image.network(
                    'https://www.picng.com/upload/chevrolet/png_chevrolet_19615.png',
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  child: Container(
                    color: Colors.greenAccent,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border.all(color: Colors.blue)),
                          child: Center(
                            child: Text(
                              '\$${transaction[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.greenAccent,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              Text(transaction[index].name),
                              SizedBox(height: 10),
                              Text(
                                DateFormat.yMMMEd()
                                    .format(transaction[index].date),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
