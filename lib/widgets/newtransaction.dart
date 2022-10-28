import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/widgets/models/style_calss.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enterdTitle = _titleController.text;
    final enterdAmount = double.parse(_amountController.text);

    if (enterdTitle.isEmpty || enterdAmount <= 0 && _selectedDate == null) {
      return;
    }
    widget.addTx(
      enterdTitle,
      enterdAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _perventDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'T I T L E',
              labelStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(),
              icon: Icon(Icons.input),
            ),
            onSubmitted: (_) => _submitData,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _amountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'A M O U N T',
              labelStyle: TextStyle(fontSize: 20),
              icon: Icon(Icons.ac_unit_outlined),
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData,
          ),
        ),
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}',
                  style: myText20(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                    onPressed: () {
                      _perventDatePicker();
                    },
                    child: Text(
                      'Choose Date',
                      style: myText30(),
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
          child: TextButton(
            onPressed: _submitData,
            child: Text(
              'ADD TRANSACTION',
              style: myText30(),
            ),
          ),
        ),
      ],
    );
  }
}
