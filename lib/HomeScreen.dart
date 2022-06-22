import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/AddItemScreen.dart';
import 'package:provider2/ItemAddNotifier.dart';
import 'package:provider2/ShopNameNotifier.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super();
  final String title = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return AddItemScreen();
                    },
                  ),
                );
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ItemAddNotifier>(
                builder:
                    (BuildContext context, ItemAddNotifier itemAddNotifier, _) {
                  return ListView.builder(
                    itemCount: itemAddNotifier.itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          itemAddNotifier.itemList[index].itemName,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<ShopNameNotifier>(
              builder:
                  (BuildContext context, ShopNameNotifier shopNameNotifier, _) {
                return Text("Shop Name: ${shopNameNotifier.shopName}");
              },
            )
          ],
        ),
      ),
    );
  }
}
