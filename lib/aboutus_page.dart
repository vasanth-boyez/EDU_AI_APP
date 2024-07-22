import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "App Description",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Our mission is to provide a platform for students. "
                  "Whether it's coding, designing, or any other field."
                  "With a simple and user-friendly interface,aims to facilitate student collaboration.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Email: eduAI@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Phone: +91 934XX XXXXX",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Developers",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Display developers in a row grid without scrollbar
                DeveloperGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeveloperGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 10),
          DeveloperCard(name: "Harsha", imagePath: "assets/pics/harsha.jpg"),
          // SizedBox(width: 10),
          // DeveloperCard(name: "Harsha", imagePath: "assets/pics/harsha.jpg"),
          SizedBox(width: 10),
          DeveloperCard(name: "Vivek", imagePath: "assets/pics/viv.jpg"),
          SizedBox(width: 10),
          DeveloperCard(name: "Boyez", imagePath: "assets/pics/boyaz.jpg"),
          SizedBox(width: 10),
          DeveloperCard(name: "Saikumar", imagePath: "assets/pics/sai.jpg"),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String? imagePath;

  DeveloperCard({
    required this.name,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage:
                  imagePath != null ? AssetImage(imagePath!) : null,
              backgroundColor: Colors
                  .grey, // Use a default background color if no image path is provided
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}