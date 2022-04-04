import 'package:flutter/material.dart';
import 'layout/home_screen.dart';
import 'package:get/get.dart';

void main() async{
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal,iconTheme: const IconThemeData(color: Colors.teal)),
      home: const HomeScreen(),
    );
  }
}

