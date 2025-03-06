import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';



class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {


  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CounterProvider>(context,listen: false);
    Timer.periodic(const Duration(seconds: 2),(timer){
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text('Count',
          style: TextStyle(
          color: Colors.white
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
          onPressed: (){
            Provider.of<CounterProvider>(context,listen: false).setCount();
            // context.read<CounterProvider>().setCount() ;
          },
        child: const Icon(Icons.add,color: Colors.white,)
      ),
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Consumer<CounterProvider>(
            builder: (context,value,child){
              print('call him');
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(value.count.toString(),
                      style: const TextStyle(
                          fontSize: 50
                      ),),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
