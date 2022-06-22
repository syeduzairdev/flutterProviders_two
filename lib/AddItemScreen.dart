import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/ItemAddNotifier.dart';
import 'package:provider2/ShopNameNotifier.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen() : super();
  final String title = 'Add Item';
  final TextEditingController _itemAddController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _itemAddController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15), hintText: "Item Name"),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text('Add Item'),
              onPressed: () {
                if (_itemAddController.text.isEmpty) {
                  return;
                }
                Provider.of<ItemAddNotifier>(context, listen: false)
                    .addItem(_itemAddController.text);
                Navigator.pop(context);
              },
            ),
            TextField(
              controller: _shopNameController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15), hintText: "Shop Name"),
            ),
            RaisedButton(
              child: Text('Update Shop Name'),
              onPressed: () {
                if (_shopNameController.text.isEmpty) {
                  return;
                }
                Provider.of<ShopNameNotifier>(context, listen: false)
                    .updateShopName(_shopNameController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
