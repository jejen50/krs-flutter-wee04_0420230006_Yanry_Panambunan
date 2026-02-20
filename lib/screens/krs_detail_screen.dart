import 'package:flutter/material.dart';

class KrsDetailScreen extends StatelessWidget {
  final int totalCredits;

  KrsDetailScreen(this.totalCredits);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KRS Summary"),
      ),
      body: Center(
        child: Text(
          "Total Credits: $totalCredits",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
