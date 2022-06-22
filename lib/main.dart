import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/HomeScreen.dart';
import 'package:provider2/ItemAddNotifier.dart';
import 'package:provider2/ShopNameNotifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemAddNotifier>(create: (BuildContext context) {
          return ItemAddNotifier();
        }),
        ChangeNotifierProvider<ShopNameNotifier>(
            create: (BuildContext context) {
          return ShopNameNotifier();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: missing_required_param
        home: HomeScreen(),
      ),
    );
  }
}
