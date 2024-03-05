import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mentorow/models/course_model.dart';
import 'package:mentorow/screens/details_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  late Future<List<Course>> futureCourses;
  List<String> imageUrls = [
    'assets/images/mern.png',
    'assets/images/dm.png',
    'assets/images/ds.png',
    'assets/images/mern.png',
    'assets/images/dm.png',
    'assets/images/ds.png'
  ];

  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    futureCourses = fetchCourses();

    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    _scrollController = ScrollController();

    // Scroll to the bottom of the GridView after 3 seconds
    Timer(Duration(seconds: 3), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      // Scroll back to the top after another 3 seconds
      Timer(Duration(seconds: 3), () {
        _scrollController.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<Course>> fetchCourses() async {
    final response = await http.get(
      Uri.parse('https://mentorow.onrender.com/api/course/AllCourse'),
    );

    if (response.statusCode == 200) {
      List<dynamic> coursesJson = jsonDecode(response.body)['courses'];
      List<Course> courses =
          coursesJson.map((json) => Course.fromJson(json)).toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Replace with your desired color
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // Hide back button from app bar
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          elevation: 0,
          title: Image.asset(
            'assets/icons/MentorowLogo.png',
            width: 160,
            height: 70,
            fit: BoxFit.cover,
          ), // Remove back button
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: getPopularCourseUI(),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<Course>>(
                future: futureCourses,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          Course course = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to course details screen with all details
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(course: course),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          imageUrls[index],
                                          alignment: Alignment.topCenter,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          course.courseName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }

                  // By default, show a loading spinner
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: _fadeInAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeInAnimation.value,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Text.rich(
                          TextSpan(
                            text: 'Learn\n',
                            style: TextStyle(
                              fontSize: 28, // Increased font size here
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..color = Colors.white
                                ..strokeWidth = 1.0,
                            ),
                            children: const [
                              WidgetSpan(
                                child: SizedBox(height: 5),
                              ),
                              TextSpan(
                                text: 'The\t',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: 'Future\n',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.blue,
                                ),
                              ),
                              WidgetSpan(
                                child: SizedBox(height: 5),
                              ),
                              TextSpan(
                                text: 'with us',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Text.rich(
                          TextSpan(
                            text: 'Learn\n',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Theme.of(context).primaryColor,
                            ),
                            children: const [
                              WidgetSpan(
                                child: SizedBox(height: 5),
                              ),
                              TextSpan(
                                text: 'The\t',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Future\n',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.blue,
                                ),
                              ),
                              WidgetSpan(
                                child: SizedBox(height: 5),
                              ),
                              TextSpan(
                                text: 'with us',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
