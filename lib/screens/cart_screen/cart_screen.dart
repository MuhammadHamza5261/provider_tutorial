import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/cart_provider.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Consumer<CartProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.selectedItems.length,
                      itemBuilder: (context,index){
                        return ListTile(
                           title: Text(value.selectedItems[index]),
                             trailing: IconButton(
                             onPressed: (){
                               value.removeItem(value.selectedItems[index], 10.0);

                  },
                             icon: Icon(Icons.remove_circle)
                        ),
                        );

                  }
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                  child: Text('Total \$${value.totalPrice}',
                    style: const TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      value.addItem("Product ${value.selectedItems.length}", 10.0);
                    },
                    child: Text('Add Item')
                )
              ],
            );

          },



        )
      ),
    );
  }
}
