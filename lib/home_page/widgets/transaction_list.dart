//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incexptracker/add_income/add_income.dart';
import 'package:incexptracker/common/model/income_model.dart';

class TransactionList extends StatelessWidget {
  final Color color;
  final Income data;

  const TransactionList({super.key, required this.color, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddIncome(
              data: data,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 15,
          right: 20,
        ),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 8, right: 0),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: color.withOpacity(0.6),
                  child: Icon(
                    data.icon,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(data.category),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 80),
                child: Column(
                  children: [
                    Text(
                      " ₹ ${data.income}",
                      style: TextStyle(
                          color: data.isIncome == true
                              ? Colors.green
                              : Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${data.date.day}/${data.date.month}/${data.date.year}",
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
