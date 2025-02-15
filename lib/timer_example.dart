import 'package:flutter/material.dart';
import 'dart:async';


class TimerExample extends StatefulWidget {
  const TimerExample({Key? key}) : super(key: key);

  @override
  State<TimerExample> createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {

  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1),(timer){
      count++;
      print(count);
      setState(() {
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(count.toString(),style: TextStyle(
          fontSize: 50
        ),),
      ),
    );
  }
}
