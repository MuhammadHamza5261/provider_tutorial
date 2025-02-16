import 'package:flutter/material.dart';
class StfHomeScreen extends StatefulWidget {
  const StfHomeScreen({super.key});

  @override
  State<StfHomeScreen> createState() => _StfHomeScreenState();
}

class _StfHomeScreenState extends State<StfHomeScreen> {

  int count = 0;


  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            count++;
            print(count++);
            setState(() {

            });

          },
          child: const Icon(Icons.add),
      ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Center(
               child: Text(count.toString(),style: const TextStyle(
                 fontSize: 50
               ),),
             ),
           ],
         ),
    );
  }
}
