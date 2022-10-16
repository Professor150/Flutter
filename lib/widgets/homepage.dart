import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/widgets/models/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Translation> transaction = [
    Translation(id: '1', name: 'Pradeep  ', amount: 100, date: DateTime.now())
  ];

  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.add,
          ),
        ],
        title: Text(' T O D O A P P'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.deepPurple, Colors.green.shade300])),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.centerRight,
                colors: <Color>[Colors.deepPurple, Colors.green.shade300])),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow.shade100),
              child: Center(
                child: Text(
                  ' TO DO APP',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: Text('ADD TRANSACTION'),
            ),
            SizedBox(height: 10),
            Column(
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
          ],
        ),
      ),
    );
  }
}
