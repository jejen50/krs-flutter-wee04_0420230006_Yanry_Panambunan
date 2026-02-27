import 'package:flutter/material.dart';
import 'add_course_screen.dart';

class Course {
  final String name;
  final int credits;
  final String semester;
  final bool isMandatory;

  Course({
    required this.name,
    required this.credits,
    required this.semester,
    required this.isMandatory,
  });
}

class KrsScreen extends StatefulWidget {
  const KrsScreen({super.key});

  @override
  State<KrsScreen> createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  List<Course> courses = [];
  int totalCredits = 0;

  void _navigateToAddCourse() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddCourseScreen(),
      ),
    );

    // VALIDATION GATE (Receive Data)
    if (result != null && result is Course) {
      setState(() {
        courses.add(result);
        totalCredits += result.credits;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KRS Semester"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selected Courses",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text("${course.credits} SKS - ${course.semester}"),
                    trailing: course.isMandatory
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                  );
                },
              ),
            ),

            const Divider(),

            Text(
              "Total Credits: $totalCredits",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _navigateToAddCourse,
                child: const Text("Add Course"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}