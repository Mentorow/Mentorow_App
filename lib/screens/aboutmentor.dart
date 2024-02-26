import 'package:flutter/material.dart';
import 'package:mentorow/models/all_mentordetails_model.dart';

class MentorDetailsPage extends StatelessWidget {
  final Mentor mentor;

  const MentorDetailsPage({Key? key, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(mentor.photo),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              mentor.name,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Domain:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              mentor.domain,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Field of Expertise:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              mentor.areaOfExpertise,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'LinkedIn Profile:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                // Open the mentor's LinkedIn profile
              },
              child: Text(
                mentor.linkedinUrl,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
