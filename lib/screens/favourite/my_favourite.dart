import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Instead of replacing with itself
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favProvider.selectedItems.length,
                itemBuilder: (context, index) {
                  int itemNumber = favProvider.selectedItems[index]; // Get actual item number
                  return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(itemNumber)) {
                            value.removeItem(itemNumber);
                          } else {
                            value.addItem(itemNumber);
                          }
                        },
                        title: Text('Items ${itemNumber.toString()}'),
                        trailing: Icon(
                          value.selectedItems.contains(itemNumber) ? Icons.favorite : Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
