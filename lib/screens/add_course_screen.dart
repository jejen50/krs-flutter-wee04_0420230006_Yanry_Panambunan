import 'package:flutter/material.dart';
import 'krs_screen.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController creditController = TextEditingController();

  String semester = "Semester 1";
  bool isMandatory = false;
  String errorMessage = "";

  void onSubmit() {
    final name = courseController.text.trim();
    final credit = int.tryParse(creditController.text);

    // VALIDATION GATE
    if (name.isEmpty) {
      setState(() {
        errorMessage = "Course name cannot be empty";
      });
      return;
    }

    if (credit == null || credit <= 0) {
      setState(() {
        errorMessage = "Credits must be a valid number > 0";
      });
      return;
    }

    // ACCEPT DATA
    final newCourse = Course(
      name: name,
      credits: credit,
      semester: semester,
      isMandatory: isMandatory,
    );

    Navigator.pop(context, newCourse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Course"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: "Course Name",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: creditController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Credits",
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: semester,
              items: List.generate(
                8,
                (index) => DropdownMenuItem(
                  value: "Semester ${index + 1}",
                  child: Text("Semester ${index + 1}"),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  semester = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Mandatory Course"),
              value: isMandatory,
              onChanged: (value) {
                setState(() {
                  isMandatory = value!;
                });
              },
            ),

            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubmit,
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}