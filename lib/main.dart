import 'package:flutter/material.dart';
import 'package:form_builder/module/form_module/view/form_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormView(),
    );
  }
}
