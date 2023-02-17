import 'package:flutter/material.dart';
import 'package:form_builder/form_view/form_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormView(),
    );
  }
}
