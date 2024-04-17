import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Text('Welcome to the Home Page!'),
        ),
      ),
    );
  }
}
