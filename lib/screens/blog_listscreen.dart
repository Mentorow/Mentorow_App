import 'package:flutter/material.dart';
import 'package:mentorow/constants/color.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({Key? key}) : super(key: key);

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  bool _isDarkMode = true;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent navigation when back button is pressed
        return false;
      },
      child: Theme(
        data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          backgroundColor:
              _isDarkMode ? const Color(0xFF030303) : Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _isDarkMode ? Colors.white : Colors.black,
                    width: 1,
                  ),
                ),
              ),
              child: AppBar(
                automaticallyImplyLeading:
                    false, // Hide back button from app bar
                toolbarHeight: 100,
                backgroundColor: Colors.black,
                elevation: 0,
                title: Image.asset(
                  'assets/icons/MentorowLogo.png',
                  width: 160,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _isDarkMode ? Colors.white : Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    'THE BLOG',
                    style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                     Text(
                      'Recent Blog Post',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/dm.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sunday, 01 January 2024',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.deepPurpleAccent, // Use your desired color
                      ),
                    ),
                    const SizedBox(height: 10),
                     Text(
                      'UX Review Presentation',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                     Text(
                      'Subtitle context',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDesignBox(
                              text: 'design',
                              color: const Color.fromARGB(255, 91, 59, 146),
                            ),
                            _buildDesignBox(
                                color: const Color.fromARGB(255, 195, 88, 56),
                                text: 'Research'),
                            _buildDesignBox(
                                color: const Color.fromARGB(255, 110, 83, 185),
                                text: 'presentation')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/dm.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sunday, 01 January 2024',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.deepPurpleAccent, // Use your desired color
                      ),
                    ),
                    const SizedBox(height: 10),
                     Text(
                      'UX Review Presentation',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                       color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                     Text(
                      'Subtitle context',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                       color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDesignBox(
                              text: 'design',
                              color: const Color.fromARGB(255, 91, 59, 146),
                            ),
                            _buildDesignBox(
                                color: const Color.fromARGB(255, 195, 88, 56),
                                text: 'Research'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/dm.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sunday, 01 January 2024',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.deepPurpleAccent, // Use your desired color
                      ),
                    ),
                    const SizedBox(height: 10),
                     Text(
                      'UX Review Presentation',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                       color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                     Text(
                      'Subtitle context',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                       color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDesignBox(
                              text: 'design',
                              color: const Color.fromARGB(255, 91, 59, 146),
                            ),
                            _buildDesignBox(
                                color: const Color.fromARGB(255, 110, 83, 185),
                                text: 'presentation'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                   
                     Text(
                      'All Blog Posts',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       color: _isDarkMode? Colors.white : Colors.black,
                      ),
                    ),
     const SizedBox(height: 20),
                    _buildBlogPostsRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: _isDarkMode? const Color(0xFF030303): Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset('assets/icons/MentorowLogo.png')),
              ListTile(
                title: Align(
                  alignment: Alignment.center,
                  child: Text(_isDarkMode?'Light Mode':'Dark Mode')),
                titleTextStyle:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color:  _isDarkMode?Colors.white:Colors.black
                ),
                trailing: Switch.adaptive(
                 activeColor: kPrimaryLight,
                 activeTrackColor: Colors.white,
                 inactiveTrackColor: kBackgroundColor,
                 inactiveThumbColor: kPrimaryLight,
                  value: _isDarkMode, 
                  onChanged: (value) {
                    Navigator.pop(context);
                    toggleTheme();
                  },),
              )
            ],
          ),
        ),
      ),
      )
    );
  }

Widget _buildBlogPostsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildBlogPost(
            image: 'assets/images/recent_blog_post.jpg',
            date: 'Sunday, 01 January 2024',
            title: 'UX Review Presentation',
            subtitle: 'Subtitle context',
          ),
          _buildBlogPost(
            image: 'assets/images/recent_blog_post.jpg',
            date: 'Sunday, 01 January 2024',
            title: 'UX Review Presentation',
            subtitle: 'Subtitle context',
          ),
          _buildBlogPost(
            image: 'assets/images/recent_blog_post.jpg',
            date: 'Sunday, 01 January 2024',
            title: 'UX Review Presentation',
            subtitle: 'Subtitle context',
          ),
        ],
      ),
    );
  }

  Widget _buildBlogPost({
    required String image,
    required String date,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 200,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.deepPurpleAccent,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isDarkMode?Colors.white:Colors.black,
            ),
          ),
          Text(
            subtitle,
            style:  TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: _isDarkMode?Colors.white:Colors.black,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }


Widget _buildDesignBox({required Color color, required String text}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      constraints: const BoxConstraints(minWidth: 120),
      width: 80, // Adjust width as needed
      height: 40, // Adjust height as needed
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style:  const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
}
