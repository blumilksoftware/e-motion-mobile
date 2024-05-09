import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/emotion-76.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8,),
            const Text('E-Motion'),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Escooters Home Page!'),
      ),
    );
  }
}
