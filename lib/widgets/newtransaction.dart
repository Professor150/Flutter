import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enterdTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);

    if (enterdTitle.isEmpty || enterdAmount <= 0) {
      return;
    }
    widget.addTx(
      enterdTitle,
      enterdAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            // onChanged: ((value) => titleInput = value),
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'T I T L E',
              labelStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(),
              icon: Icon(Icons.input),
            ),
            onSubmitted: (_) => submitData,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: amountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'A M O U N T',
              labelStyle: TextStyle(fontSize: 20),
              icon: Icon(Icons.ac_unit_outlined),
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
          child: TextButton(
            onPressed: submitData,
            child: Text('ADD TRANSACTION'),
          ),
        ),
      ],
    );
  }
}
