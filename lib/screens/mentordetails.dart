import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mentorow/constants/color.dart';
import 'package:mentorow/models/all_mentordetails_model.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MentorDetailScreen extends StatefulWidget {
  @override
  State<MentorDetailScreen> createState() => _MentorDetailScreenState();
}

class _MentorDetailScreenState extends State<MentorDetailScreen> {
  late Future<List<Mentor>> mentors;

  @override
  void initState() {
    super.initState();
    mentors = fetchMentor();
  }

  Future<List<Mentor>> fetchMentor() async {
    List<Mentor> mentoritems = [];
    try {
      final response = await http.get(
          Uri.parse("https://mentorow.onrender.com/api/mentor/Allmentors/"));
      print("response == $response");
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('getMentors')) {
          final jsonArray = jsonResponse['getMentors'] as List<dynamic>;
          mentoritems =
              jsonArray.map((itemJson) => Mentor.fromJson(itemJson)).toList();
          return mentoritems;
        }
      } else {
        throw Exception("Failed to load mentors");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to fetch mentors");
    }
    return []; // You can return an empty list or handle the case differently based on your requirement
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: FutureBuilder<List<Mentor>>(
          future: mentors,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No mentors found'));
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(
                    25, 40, 25, 25), // Padding for the entire ListView
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Mentor mentor = snapshot.data![index];
                    return buildMentorProfile(
                      name: mentor.name,
                      imageUrl: mentor.photo,
                      domain: mentor.domain,
                      areaOfExpertise: mentor.areaOfExpertise,
                      onTap: () {
                       
                      },
                      linkedinUrl: '',
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildMentorProfile({
    required String name,
    required String imageUrl,
    required String domain,
    required String areaOfExpertise,
    required String linkedinUrl, // Add linkedinUrl parameter
    required VoidCallback onTap,
  }) {
    print(
        'Mentor Name: $name'); // Check if mentor's name is being received correctly
    print('Mentor Image URL: $imageUrl');
    return Card(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: name,
                style: const TextStyle(
                  color: nearlyWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                children: const [
                  WidgetSpan(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  WidgetSpan(
                      child: Icon(
                    Icons.verified,
                    color: kPrimaryLight,
                    size: 28,
                  ))
                ],
              ),
            ),
            Text(
              domain,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                color: Colors.yellowAccent,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryLight,
                child: InkWell(
                  onTap: () async {
                    try {
                      if (await canLaunchUrlString(linkedinUrl)) {
                        await launchUrlString(linkedinUrl);
                      } else {
                        // Show a Snackbar if the URL can't be launched
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: kPrimaryColor,
                            content: Text('Failed to launch LinkedIn profile'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    } catch (e) {
                      // Handle any other errors that may occur
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  splashColor: darkTextColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          imageUrl,
                          style: const TextStyle(
                            fontSize: 16.8,
                            fontWeight: FontWeight.w600,
                            color: nearlyWhite,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Image.asset('assets/icons/lnkdn.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Mentor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Colors.yellowAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  areaOfExpertise,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
