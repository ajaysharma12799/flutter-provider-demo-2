import 'package:flutter/material.dart';
import 'package:flutter_state_managment_2/provider/TaskModel.dart';
import 'package:provider/provider.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Provider Demo",
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (ctx) => TaskProvider(),
        child: HomePage(),
      ),
    );
  }
}
