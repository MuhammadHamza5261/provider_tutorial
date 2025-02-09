import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);


  // stl ma hum ak bar kisi variable ko define kar dan to
  // osa change nahi kar skta

  // stl are mutable because ya apni state ko change nahi karta

   /*
   jab hum is x ka sath final use kara gan to iski value nahi ho skti
   otherwise change ho skti ha
    */

   int x = 0;


  @override
  Widget build(BuildContext context) {
    print('Build is call them');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            x++;
            print(x);
          }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: Text(x.toString(),style: const TextStyle(fontSize: 50),))

        ],
      ),
    );
  }
}
