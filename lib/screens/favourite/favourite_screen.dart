import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/screens/favourite/my_favourite.dart';
import 'package:provider/provider.dart';
// Make sure this is imported

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteScreen()));
            },
            child: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text('Items ${index.toString()}'),
                        trailing: Icon(
                          value.selectedItems.contains(index) ? Icons.favorite : Icons.favorite_border_outlined,
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
