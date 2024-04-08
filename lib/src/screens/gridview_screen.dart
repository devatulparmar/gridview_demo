import 'package:demoapp/src/utils/const.dart';
import 'package:flutter/material.dart';

class MyGridViewScreen extends StatefulWidget {
  const MyGridViewScreen({super.key});

  @override
  State<MyGridViewScreen> createState() => _MyGridViewScreenState();
}

class _MyGridViewScreenState extends State<MyGridViewScreen> {
  // List<Widget> myList() {
  //   List<Widget> widget = [];
  //   for (int i = 0; i < 10; i++) {
  //     widget.add(Container(
  //       padding: const EdgeInsets.all(8),
  //       color: Colors.teal[100],
  //       child: Text("$i"),
  //     ));
  //   }
  //   return widget;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        reverse: true,
        childAspectRatio: MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height,
        children: List.generate(
          1000,
          (index) => Container(
            padding: const EdgeInsets.all(8),
            color: index % 10 == 0 ? Colors.teal[100] : Colors.red.shade100,
            child: index % 2 == 0
                ? Text("$index")
                : Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("Show Date"),
                      ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
