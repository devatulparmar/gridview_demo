
import 'package:demoapp/src/screens/new_screen.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Second Screen'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            // Navigator.pop(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute (
                builder: (BuildContext x) => const MyHome(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (){
                // Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute (
                    builder: (BuildContext x) => const NewScreen(),
                  ),
                );
              },
              child: const Text('Go to New Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
