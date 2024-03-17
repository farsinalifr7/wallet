// import 'package:flutter/material.dart';
// import 'package:incexptracker/common/lenear_gradiant_text.dart';

// class AddExpense extends StatefulWidget {
//   const AddExpense({super.key});

//   @override
//   State<AddExpense> createState() => _AddExpenseState();
// }

// class _AddExpenseState extends State<AddExpense> {
//   //@override
//   //FocusNode _focusNode = FocusNode();
//   @override
//   void initState() {
//     super.initState();
//     //_focusNode.addListener(s));
//   }

//   DateTime selectedDate = DateTime.now();

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//           backgroundColor: Colors.grey[100],
//           title: const GradientText(
//             text: 'Add Expense',
//             style: TextStyle(fontSize: 30),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.red,
//                 Colors.purple,
//                 Colors.pink,
//                 Colors.purple,
//                 Colors.deepPurple,
//               ],
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: const TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.all(12),
//                       child: Text(
//                         "      ₹",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     border: InputBorder.none,
//                     //labelText: " 0",
//                     //prefix: Icon(Icons.note),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const TextField(
//                   // textAlign: TextAlign.start,
//                   keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     labelText: "     Description",
//                     // contentPadding: EdgeInsets.only(
//                     //     left: 20, right: 15, top: 12, bottom: 12)
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   //focusNode: _focusNode,

//                   onChanged: (value) {
//                     selectDate(context);
//                   },
//                   keyboardType: TextInputType.datetime,
//                   decoration: const InputDecoration(
//                     //prefixIcon: Icon(Icons.note),
//                     border: InputBorder.none,
//                     labelText: "     Date",
//                     //prefix: Icon(Icons.note),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const TextField(
//                   keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     labelText: "     Category",
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 height: 45,
//                 width: 300,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     gradient: const LinearGradient(colors: [
//                       Colors.red,
//                       Colors.pink,
//                       Colors.purple,
//                       Colors.deepPurple,
//                     ])),
//                 child: const Text(
//                   "Save",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
//...............................
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incexptracker/common/lenear_gradiant_text.dart';
import 'package:incexptracker/common/model/income_model.dart';
import 'package:incexptracker/add_income/widget/category_button.dart';
import 'package:incexptracker/home_page/home_page.dart';
import 'package:incexptracker/providers/income_controller.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  final Income? data;
  const AddExpense({super.key, this.data});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  late IconData _icon;
  TextEditingController incomeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkEdit();
  }

  void checkEdit() {
    if (widget.data != null) {
      incomeController.text = widget.data!.income.toString();
      dateController.text = widget.data!.date.toString();
      descriptionController.text = widget.data!.description.toString();
      categoryController.text = widget.data!.category.toString();
      selectedDate = widget.data!.date;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    close();
    super.dispose();
  }

  void close() {
    incomeController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dateController.text =
        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            )
          ],
          backgroundColor: Colors.grey[100],
          title: GradientText(
            text: widget.data == null ? "Add Expense" : "Edit Expense",
            style: const TextStyle(fontSize: 30),
            gradient: const LinearGradient(
              colors: [
                Colors.red,
                Colors.purple,
                Colors.pink,
                Colors.purple,
                Colors.deepPurple,
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: incomeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "    ₹",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Description",
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: dateController,
                    onTap: () => selectDate(context),
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Date",
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: categoryController,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Choose Category'),
                            content: const Column(
                              children: [
                                Row(
                                  children: [
                                    CategoryButton(
                                      color: Colors.blue,
                                      text: "Home",
                                      icon: Icons.home,
                                    ),
                                    CategoryButton(
                                      color: Colors.green,
                                      text: "Rent",
                                      icon: Icons.money,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CategoryButton(
                                      color: Colors.red,
                                      text: "Petrol",
                                      icon: Icons.car_crash,
                                    ),
                                    CategoryButton(
                                      color: Colors.amber,
                                      text: "Food",
                                      icon: Icons.food_bank,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CategoryButton(
                                      color: Colors.deepPurple,
                                      text: "salery",
                                      icon: Icons.currency_rupee,
                                    ),
                                    CategoryButton(
                                      color: Colors.brown,
                                      text: "Mobile",
                                      icon: Icons.mobile_off,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CategoryButton(
                                      color: Colors.pink,
                                      text: "current",
                                      icon: Icons.elevator,
                                    ),
                                    CategoryButton(
                                      color: Colors.teal,
                                      text: "charity",
                                      icon: Icons.chair,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        categoryController.text = value[0];
                        _icon = value[1];
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Category",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(builder: (_, ref, __) {
                return InkWell(
                  onTap: () {
                    if (widget.data == null) {
                      ref.watch(incomeProvider.notifier).addNewIncome(Income(
                            icon: _icon,
                            incomeId: const Uuid().v1().toString(),
                            income: double.parse(incomeController.text),
                            description: descriptionController.text,
                            date: selectedDate,
                            category: categoryController.text,
                            isIncome: false,
                            //icon: _icon
                          ));
                      if (widget.data != null) {
                        ref.watch(incomeProvider.notifier).updateIncome(Income(
                              icon: _icon,
                              incomeId: widget.data!.incomeId,
                              income: double.parse(incomeController.text),
                              description: descriptionController.text,
                              date: selectedDate,
                              category: categoryController.text,
                              isIncome: false,
                            ));
                      }
                    }

                    //print(_icon);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(colors: [
                          Colors.red,
                          Colors.pink,
                          Colors.purple,
                          Colors.deepPurple,
                        ])),
                    child: Text(
                      widget.data == null ? "Save" : "Update",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                );
              })
            ],
          ),
        ));
  }
}
