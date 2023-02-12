import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torfoncourestask/screens/coursepage.dart';
import 'package:torfoncourestask/screens/service/courseprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Courseprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Coursepage(),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
