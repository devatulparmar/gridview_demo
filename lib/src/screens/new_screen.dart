import 'package:demoapp/main.dart';
import 'package:demoapp/src/screens/second_screen.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('New Screen'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute (
            //     builder: (BuildContext x) => const MyHome(),
            //   ),
            // );
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext x) => const SecondScreen()),
              (Route<dynamic> route) => false,
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
              onPressed: () {
                // Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext x) => const MyHome(),
                  ),
                );
              },
              child: const Text('Go Home'),
            ),
          ),
        ],
      ),
    );
  }
}
