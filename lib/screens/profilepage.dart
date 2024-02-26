import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _contact = '';

  void _shareProfile() {
    // Implement share functionality here
    print('Sharing profile: $_name ($_contact)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0),
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade500,
                    Colors.purple.shade900,
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Edit Profile Button

                // Profile Picture
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Implement profile picture upload functionality here
                        print('Uploading profile photo');
                      },
                      child: Container(
                        width: 160, // Adjust as needed
                        height: 250, // Adjust as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white, width: 4), // Optional border
                        ),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage(
                              'assets/icons/user.png'), // Asset image
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                // Name
                Center(
                  child: Text(
                    'Name: $_name',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 8.0),
                // Email
                Center(
                  child: Text(
                    'Contact: $_contact',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
