import 'package:edu_ai_app/python_course.dart';
import 'package:flutter/material.dart';
import 'go_course.dart';
import 'java_course.dart';

class UserCoursesPage extends StatelessWidget {
  const UserCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Courses Page',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          CourseItem1(courseName: 'Go Lang', instructor: 'John Doe'),
          CourseItem2(courseName: 'Java Programming', instructor: 'Jane Smith'),
          CourseItem3(courseName: 'Python Programming', instructor: 'Alex Johnson'),
          // Add more CourseItem widgets as needed
        ],
      ),
    );
  }
}

class CourseItem1 extends StatelessWidget {
  final String courseName;
  final String instructor;

  const CourseItem1({
    Key? key,
    required this.courseName,
    required this.instructor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: ListTile(
        title: Text(courseName),
        subtitle: Text('Instructor: $instructor'),
        onTap: () {
          // Add your logic to navigate or handle the course item tap
          // For example, navigate to a detailed course page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(courseName)));
          Navigator.push(context, MaterialPageRoute(builder: (context) => GoProgrammingApp()));
          //Navigator.push(context, MaterialPageRoute(builder: (context) => JavaProgrammingApp()));
        },
      ),
    );
  }
}
class CourseItem2 extends StatelessWidget {
  final String courseName;
  final String instructor;

  const CourseItem2({
    Key? key,
    required this.courseName,
    required this.instructor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: ListTile(
        title: Text(courseName),
        subtitle: Text('Instructor: $instructor'),
        onTap: () {
          // Add your logic to navigate or handle the course item tap
          // For example, navigate to a detailed course page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(courseName)));
          //Navigator.push(context, MaterialPageRoute(builder: (context) => GoProgrammingApp()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => JavaProgrammingApp()));
        },
      ),
    );
  }
}
class CourseItem3 extends StatelessWidget {
  final String courseName;
  final String instructor;

  const CourseItem3({
    Key? key,
    required this.courseName,
    required this.instructor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: ListTile(
        title: Text(courseName),
        subtitle: Text('Instructor: $instructor'),
        onTap: () {
          // Add your logic to navigate or handle the course item tap
          // For example, navigate to a detailed course page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(courseName)));
          //Navigator.push(context, MaterialPageRoute(builder: (context) => GoProgrammingApp()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => PythonProgrammingApp()));
        },
      ),
    );
  }
}
