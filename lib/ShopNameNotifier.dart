import 'package:flutter/material.dart';

class ShopNameNotifier extends ChangeNotifier {
  String shopName = '';

  updateShopName(String shopName) async {
    this.shopName = shopName;
    notifyListeners();
  }
}
