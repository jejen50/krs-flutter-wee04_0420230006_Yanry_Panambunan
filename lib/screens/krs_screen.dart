import 'package:flutter/material.dart';

class KrsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KRS")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mata Kuliah:"),
            Text("- Object oriented Programming"),
            Text("- Basis Data"),
            Text("- Rekayasa Perangkat Lunak"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
