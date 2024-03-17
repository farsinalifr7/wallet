import 'package:flutter/material.dart';

class HomePagecard extends StatefulWidget {
  const HomePagecard({super.key});

  @override
  State<HomePagecard> createState() => _HomePagecardState();
}

class _HomePagecardState extends State<HomePagecard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          height: 180,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: const LinearGradient(
                  colors: [Colors.pink, Colors.deepPurple])),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "₹ 4300.00",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          "₹ 3434.00",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Expence",
                          style: TextStyle(color: Colors.red[300]),
                        ),
                        const Text(
                          "₹ 3434.00",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
