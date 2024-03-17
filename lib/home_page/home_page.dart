import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incexptracker/common/model/income_model.dart';
import 'package:incexptracker/add_expence/add_expence.dart';
import 'package:incexptracker/add_income/add_income.dart';
import 'package:incexptracker/home_page/widgets/transaction_list.dart';
import 'package:incexptracker/home_page/widgets/homepagecard.dart';
import 'package:incexptracker/providers/income_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Color> color = [
    Colors.pink,
    Colors.deepPurple,
    Colors.teal,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.teal,
    Colors.brown,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.person, color: Colors.grey),
        centerTitle: true,
        title: const Text(
          "Expense tracker",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontFamily: "san-serif",
              fontStyle: FontStyle.italic),
        ),
        //centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            onPressed: () {
              //Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const HomePagecard(),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, '/home');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddExpense()),
                    );
                  },
                  child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.red,
                        border: Border.all(
                            color: Colors.pink.withOpacity(0.6), width: 2),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.pink.withOpacity(1),
                            size: 40,
                          ),
                          const Text(
                            "add Expence",
                            style: TextStyle(color: Colors.pink, fontSize: 15),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddIncome()),
                    );
                  },
                  child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.red,
                        border: Border.all(
                            color: Colors.deepPurple.withOpacity(0.6),
                            width: 2),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.money,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                          Text(
                            "add Income",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 15),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 0),
            child: Row(
              children: [
                Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.red,
                      border: Border.all(
                          color: Colors.teal.withOpacity(0.6), width: 2),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.map,
                          color: Colors.teal,
                          size: 40,
                        ),
                        Text(
                          "Records",
                          style: TextStyle(color: Colors.teal, fontSize: 15),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.red,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.6), width: 2),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.grey,
                          size: 40,
                        ),
                        Text(
                          "settings",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transactions",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                Text(
                  "View All",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ),
          Consumer(builder: (_, ref, __) {
            List<Income> income =
                ref.watch(incomeProvider.select((value) => value));

            return Expanded(
              child: ListView.builder(
                itemCount: income.length,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionList(
                    color: index > 10 ? color[index % 10] : color[index],
                    data: income[index],
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
