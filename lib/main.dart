import 'package:demoapp/src/screens/gridview_screen.dart';
import 'package:demoapp/src/screens/second_screen.dart';
import 'package:demoapp/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> list = [];
  String? dropdownValue;
  bool checkBoxMilk = false;
  bool checkBoxTea = false;
  int groupValue = 0;
  int radioMale = 1;
  int radioFemale = 2;
  int radioOthers = 3;
  DateTime currentDate = DateTime.now();
  DateTime? selectedDate;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    list = ['One', 'Two', 'Three', 'Four'];
  }

  void showDate() async {
    selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1995),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      currentDate: currentDate,
    );
    setState(() {
      currentDate = selectedDate!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  imgImage,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Divider(
                    thickness: 3,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute (
                          builder: (BuildContext x) => const MyGridViewScreen(),
                        ),
                      );

                    },
                    child: const Text("Next Screen"),
                  ),
                  ElevatedButton(
                    onPressed: showDate,
                    child: const Text("Show Date"),
                  ),
                  IconButton(
                      onPressed: showDate,
                      icon: const Icon(
                        Icons.date_range,
                        size: 35,
                        color: Colors.blueAccent,
                      ),
                  ),

                  Center(
                    child: Text(
                        'Selected Date is ${DateFormat.yMMMM().format(currentDate)}'),
                  ),
                  Row(
                    children: [
                      /// Text
                      Expanded(
                        flex: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text("Name"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Text("Age"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text("Phone Number"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Text("Address"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),

                      /// TextField
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            ///Name
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: "Enter Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            ///Age
                            const TextField(
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),

                            const SizedBox(height: 15),

                            ///Number
                            const TextField(
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),

                            const SizedBox(height: 15),

                            ///Address
                            const TextField(maxLines: 3),

                            const SizedBox(height: 20),

                            DropdownButton(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.arrow_circle_down,
                                color: Colors.red,
                              ),
                              isExpanded: true,
                              hint: const Text('Select'),
                              items: list.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                            ),

                            Row(
                              children: [
                                Checkbox(
                                  value: checkBoxTea,
                                  onChanged: (value) {
                                    checkBoxTea = value!;
                                    setState(() {});
                                  },
                                  checkColor: Colors.black,
                                  activeColor: Colors.green,
                                ),
                                const Text("Tea"),
                                Checkbox(
                                  value: checkBoxMilk,
                                  onChanged: (value) {
                                    checkBoxMilk = value!;
                                    setState(() {});
                                  },
                                  checkColor: Colors.black,
                                  activeColor: Colors.green,
                                ),
                                const Text("Milk"),
                              ],
                            ),

                            Row(
                              children: [
                                Radio(
                                  value: radioMale,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    debugPrint("radioMale $value");
                                    setState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                const Text("Male"),
                                Radio(
                                  value: radioFemale,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    debugPrint("radioFemale $value");
                                    setState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                const Text("Female"),
                                Radio(
                                  value: radioOthers,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    debugPrint("radioOthers $value");
                                    setState(() {
                                      groupValue = value!;
                                    });
                                  },
                                ),
                                const Text("Others"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  ///button
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (dropdownValue != "Select") {
                          debugPrint("Saved.");
                          debugPrint("${nameController.text}.");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Save Data"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (dropdownValue != "Select") {
                          debugPrint("Saved.");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Reset"),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      debugPrint("clicked text button");
                    },
                    child: const Text(
                      "View More",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    showDate() {
      return showDatePicker(
        context: context,
        firstDate: DateTime(1995),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        currentDate: currentDate,
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: showDate,
              child: const Text("Show Date"),
            ),
          ),
          Text('Selected Date is $currentDate'),
        ],
      ),
    );
  }
}
