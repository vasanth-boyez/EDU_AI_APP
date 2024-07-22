// user_dashboard.dart
import 'package:flutter/material.dart';
import 'aboutus_page.dart';
import 'profile_page.dart';
import 'course_page.dart';
import 'achivements_page.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const CoursesPage(),
      const UserAchievementsPage(totalQuestions: 10, correctAnswers: 7, percentage: 70.0,),
      const ProfilePage(), 
      const AboutUsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        backgroundColor: Colors.green, // Set the background color here
        selectedItemColor: Colors.blue, // Set the selected item color
        unselectedItemColor: Colors.black12.withOpacity(0.6), // Set the unselected item color with opacity
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UserProfilePage(),
        // Add any additional profile-related widgets here
      ],
    );
  }
}

/*class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UserAchievementsPage(),
        // Add any additional profile-related widgets here
      ],
    );
  }
}*/
/*class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Achievements Page'),
    );
  }
}*/

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UserCoursesPage(),
        // Add any additional profile-related widgets here
      ],
    );
  }
}

/*class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AboutUsPage(),
        // Add any additional profile-related widgets here
      ],
    );
  }
}
*/
/*class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add your profile details widgets here
    return Column(
      children: [
        Text('Name: John Doe'),
        Text('Email: john.doe@example.com'),
        // Add more details as needed
      ],
    );
  }
}*/
