import 'package:flutter/material.dart';
import 'package:final_project/profile.dart';
import 'package:final_project/dashboard.dart';
import 'package:final_project/category.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<bool> isLikedList = [false, true, false, true];
  List<String> images = [
    'assets/blog1.jpg',
    'assets/blog2.jpg',
    'assets/blog3.jpg',
    'assets/blog4.jpg'
  ];
  List<String> titles = [
    'How to decorate your home for the holidays?',
    'The Art of Creating a Cozy Living Space: Tips and Tricks',
    'Luxury on a Budget: Affordable Ways to Elevate Your Home Decor',
    'Color Psychology in Interior Design: Choosing the Right Palette'
  ];
  List<String> descriptions = [
    'A guide on how to make your home ready for the holiday season',
    'Small spaces can still pack a big punch! Learn how to optimize every inch of your interior',
    'Connect with nature inside your home by integrating natural elements and greenery for a calming ambiance.',
    'Less is more! Discover the beauty of minimalism and how it can transform your living environment.'
  ];
  List<String> usernames = [
    'Sanket Prajapati',
    'Saloni Rana',
    'Dev Mer',
    'Nivedita Parmar'
  ];
  List<String> timestamps = [
    '5 min ago',
    '1 hr ago',
    'Yesterday',
    '2 days ago'
  ];
  List<String> readersCount = [
    '1.2k readers',
    '800 readers',
    '1.5k readers',
    '500 readers'
  ];
  List<String> avatarImages = [
    'assets/user_image.png',
    'assets/user_image4.jpg',
    'assets/user_image2.jpg',
    'assets/user_image3.png',
  ];

  bool _isImageZoomed = false;
  int _zoomedImageIndex = 0;

  void _toggleImageZoom(int index) {
    setState(() {
      _isImageZoomed = !_isImageZoomed;
      _zoomedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2A2A),
      appBar: AppBar(
        backgroundColor: Color(0xFF2A2A2A),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Blogs',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Scrollbar(
                  controller: ScrollController(),
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(
                            16.0, 20.0, 16.0, 20.0),
                        child: InkWell(
                          onTap: () {
                            _toggleImageZoom(index);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white54),
                              color: Colors.transparent,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                      AssetImage(avatarImages[index]),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      usernames[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      timestamps[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          images[index],
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        titles[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        descriptions[index],
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isLikedList[index] =
                                              !isLikedList[index];
                                            });
                                          },
                                          icon: Icon(
                                            isLikedList[index]
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isLikedList[index]
                                                ? Colors.red
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Like',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                      ],
                                    ),
                                    Text(
                                      readersCount[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          _isImageZoomed
              ? Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isImageZoomed = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.8),
                child: Center(
                  child: Image.asset(
                    images[_zoomedImageIndex],
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
              ),
            ),
          )
              : SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomIconBar(),
    );
  }
}

class BottomIconBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 2.6,
            colors: [Color(0xFF1C2A9F), Color(0xFF2F2B2B)],
          ),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
              child: Icon(Icons.home_filled, color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Category()),
                );
              },
              child: Icon(Icons.category_outlined, color: Colors.white),
            ),
            GestureDetector(
              onTap: () async {
                // Add onTap action for camera icon
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF532DE0),
                ),
                padding: EdgeInsets.all(15),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 28),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogPage()),
                );
              },
              child: Icon(Icons.trending_up, color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              },
              child: Icon(Icons.person_outline, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BlogPage(),
  ));
}
