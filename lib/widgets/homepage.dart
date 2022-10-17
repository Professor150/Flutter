import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/transaction_list.dart';
import 'package:flutter_application_1/widgets/usertransaction.dart';
import 'package:intl/intl.dart';
import '/widgets/models/transaction.dart';
import 'newtransaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // late String titleInput;
  // late String amountInput;

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
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.centerRight,
                colors: <Color>[Colors.blue, Colors.green.shade300])),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                SizedBox(height: 10),
                UserTransaction(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
