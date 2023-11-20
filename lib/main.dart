import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:state_management/view/hover_animation.dart';
import 'package:state_management/view/todo_screen.dart';
// import 'package:state_management/view/inc.dart';
// import 'package:state_management/view/todo_screen.dart';
// import 'package:state_management/view/todo_screen2.dart';
// import 'package:state_management/view/inc.dart';
// import 'package:state_management/view/todo_app.dart';
// import 'package:state_management/view/increment.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: TodoScreen2(),
    );
  }
}
