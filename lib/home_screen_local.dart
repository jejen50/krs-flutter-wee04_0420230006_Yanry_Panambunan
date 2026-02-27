import 'package:flutter/material.dart';

class HomeScreenLocal extends StatelessWidget {
  const HomeScreenLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Home')),
      body: Center(child: Text('Local Home')),
    );
  }
}
