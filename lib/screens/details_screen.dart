import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mentorow/constants/color.dart';
import 'package:mentorow/models/course_model.dart';
import 'package:mentorow/screens/form.dart';

class DetailsScreen extends StatefulWidget {
  final Course course;

  const DetailsScreen({Key? key, required this.course}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.courseName),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // CarouselSlider
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: [
                    Image.asset(
                      'assets/icons/image1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/icons/image2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/icons/image3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(
                      " 4.8",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.timer, color: Colors.grey),
                    Text(
                      " ${widget.course.duration}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      " Rs.${widget.course.price}",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTabView(index: _selectedTag, changeTab: changeTab),
                Expanded(
                  child: _selectedTag == 0
                      ? Description(course: widget.course)
                      : CourseCurriculum(course: widget.course),
                ),
                SizedBox(height: 20),
                EnrollBottomSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final Course course;

  const Description({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description: ${course.description}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Additional Notes:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your additional notes here',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCurriculum extends StatelessWidget {
  final Course course;

  const CourseCurriculum({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Curriculum: ${course.courseCurriculum}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Additional Notes:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your additional notes here',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;

  const CustomTabView({
    Key? key,
    required this.changeTab,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Description", "Curriculum"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .08,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
            fontSize: 16,
            fontWeight:widget.index != index ? FontWeight.w700 : FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Navigate to the favorite screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FavoriteScreen()),
              // );
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the enroll screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthDialog()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor, // Use primary color of the current theme
                padding: const EdgeInsets.symmetric(vertical: 15), // Adjust padding as needed
              ),
              child: const Text(
                "Enroll Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
