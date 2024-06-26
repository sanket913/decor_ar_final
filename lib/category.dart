import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project/profile.dart';
import 'package:final_project/dashboard.dart';
import 'package:final_project/blog.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    home: Category(),
  ));
}

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final ScrollController _scrollController = ScrollController();
  String _selectedCategory = 'Category';
  String? _selectedImage;
  String? _selectedImageName;
  String? _selectedImageDescription;

  void _onImageTap(String category, String imagePath, String imageName, String imageDescription) {
    setState(() {
      _selectedCategory = category;
      _selectedImage = imagePath;
      _selectedImageName = imageName;
      _selectedImageDescription = imageDescription;
    });
  }

  void _onBackTap() {
    setState(() {
      _selectedCategory = 'Category';
      _selectedImage = null;
      _selectedImageName = null;
      _selectedImageDescription = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFF2A2A2A),
          child: Stack(
              children: [
              ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 130, bottom: 100),
              children: _selectedImage == null
                  ? [
                buildCategoryContainer(
                  context,
                  'Sofa',
                  [
                    {'path': 'assets/sofa1.png', 'name': 'Modern Sofa', 'description': 'Transform your living space with our Modern Sofa, featuring sleek lines, premium upholstery, and exceptional comfort. Designed for both style and durability, this sofa offers a perfect blend of elegance and practicality, making it a standout addition to any contemporary home.'},
                    {'path': 'assets/sofa2.png', 'name': 'Classic Sofa', 'description': 'Featuring refined craftsmanship and enduring style, this sofa offers both comfort and sophistication, making it a perfect centerpiece for any traditional or contemporary home'},
                    {'path': 'assets/sofa3.png', 'name': 'Comfort Sofa', 'description': 'Indulge in luxurious comfort with our Comfort Sofa, offering unparalleled relaxation and support. Sink into plush cushions and unwind in style with this epitome of comfort and sophistication.'},
                    {'path': 'assets/sofa4.png', 'name': 'Luxury Sofa', 'description': 'Indulge in opulence with our Luxury Sofa, crafted for those who seek unparalleled comfort and exquisite style. Elevate your living space with sumptuous materials and impeccable craftsmanship, offering a lavish retreat for relaxation and sophistication.'},
                    {'path': 'assets/sofa5.png', 'name': 'Vintage Sofa', 'description': 'Add a touch of timeless elegance to your living space with our Vintage Sofa. Crafted with care, this sofa exudes classic charm and offers enduring comfort, making it the perfect centerpiece for any traditional or eclectic home.'},
                  ],
                ),
                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Chairs',
                  [
                    {'path': 'assets/chair1.png', 'name': 'Office Chair', 'description': 'Enhance your workspace with our ergonomic Office Chair, designed for comfort and productivity. Featuring superior support and adjustable features, this chair ensures optimal posture during long hours of work.'},
                    {'path': 'assets/chair2.png', 'name': 'Dining Chair', 'description': 'Upgrade your dining experience with our ergonomic Dining Chair, meticulously crafted for comfort and style. Designed to enhance your posture and complement any dining table, our chair offers both functionality and elegance.'},
                    {'path': 'assets/chair3.png', 'name': 'Rocking Chair', 'description': 'Experience relaxation and comfort with our Rocking Chair. Crafted with ergonomic design and plush cushioning, this chair offers a perfect blend of style and functionality, making it an ideal choice for any living space.'},
                    {'path': 'assets/chair4.png', 'name': 'Lounge Chair', 'description': 'Experience unparalleled comfort and sophistication with our Lounge Chair. Designed with luxurious materials and ergonomic features, it offers the perfect balance of style and relaxation for your living space.'},
                    {'path': 'assets/chair5.png', 'name': 'Garden Chair', 'description': 'Elevate your outdoor relaxation with our Garden Chair. Designed for comfort and durability, this chair combines style and functionality to enhance your outdoor living space. Enjoy leisurely moments in your garden with this elegant and sturdy seating solution'},
                    {'path': 'assets/chair6.png', 'name': 'Accent Chair', 'description': 'Add a touch of sophistication to your living space with our Accent Chair. Designed for both style and comfort, this elegant chair features a modern silhouette and premium upholstery, making it the perfect addition to any contemporary home décor'},
                    {'path': 'assets/chair7.png', 'name': 'Recliner Chair', 'description': 'Experience ultimate comfort with our Recliner Chair, designed to provide luxurious relaxation. Featuring plush cushioning and adjustable reclining positions, its the perfect addition to your living space for unwinding after a long day.'},
                    {'path': 'assets/chair8.png', 'name': 'Folding Chair', 'description': 'Compact and versatile, our Folding Chair offers convenient seating solutions for any occasion. Designed for easy storage and portability, it provides comfort and support wherever you need it'},
                    {'path': 'assets/chair9.png', 'name': 'Bean Bag', 'description': 'Sink into comfort with our Bean Bag collection, offering plush seating and versatile relaxation. Crafted for both style and coziness, our Bean Bags are the perfect addition to any living space.'},
                  ],
                ),
                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Tables',
                  [
                    {'path': 'assets/table1.png', 'name': 'Dining Table', 'description': 'Upgrade your dining experience with our elegant dining table. Crafted with precision and style, our dining table offers functionality and sophistication to your space, making every meal a delightful affair.'},
                    {'path': 'assets/table2.png', 'name': 'Coffee Table', 'description': 'Discover elegance and functionality with our Coffee Tables. Elevate your living space with sleek designs and premium craftsmanship, perfect for both relaxation and entertainment'},
                    {'path': 'assets/table3.png', 'name': 'Side Table', 'description': 'Add a touch of sophistication to your living space with our stylish Side Table. Crafted with exquisite detail and modern design, this versatile piece seamlessly blends functionality with elegance, making it a perfect addition to any home décor.'},
                    {'path': 'assets/table4.png', 'name': 'Study Table', 'description': 'Enhance your workspace with our stylish Study Table, designed for both functionality and elegance. Crafted with quality materials, it offers ample space and organization for productive studying and work sessions.'},
                    {'path': 'assets/table5.png', 'name': 'Console Table', 'description': 'Enhance your workspace with our stylish Study Table, designed for both functionality and elegance. Crafted with quality materials, it offers ample space and organization for productive studying and work sessions.'},
                  ],
                ),
                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Ceiling Lights',
                  [
                    {'path': 'assets/ceiling1.png', 'name': 'Modern LED Flush Mount', 'description': 'A modern LED flush mount ceiling light with a sleek, minimalist design, perfect for contemporary interiors.'},
                    {'path': 'assets/ceiling2.png', 'name': 'Crystal Chandelier Ceiling Light', 'description': 'This elegant chandelier-style ceiling light features crystal accents, adding a touch of glamour to any room.'},
                    {'path': 'assets/ceiling3.png', 'name': 'Classic Semi-Flush Mount', 'description': 'A classic yet stylish semi-flush mount ceiling light, ideal for traditional or transitional decor settings.'},
                    {'path': 'assets/ceiling4.png', 'name': 'Industrial Pendant Ceiling Light', 'description': 'This industrial-style pendant ceiling light features a rustic metal finish, adding a touch of vintage charm to your space.'},
                    {'path': 'assets/ceiling5.png', 'name': 'Adjustable LED Ceiling Light', 'description': ' An energy-efficient LED ceiling light with adjustable brightness and color temperature, offering both functionality and versatility.'},
                    {'path': 'assets/ceiling6.png', 'name': 'Contemporary Drum Flush Mount', 'description': 'A contemporary drum-shaped flush mount ceiling light with a fabric shade, providing soft and diffused illumination for your living space.'},

                  ],
                ),

                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Ceiling Fans',
                  [
                    {'path': 'assets/fan1.png', 'name': 'Modern Breeze', 'description': 'A sleek and stylish fan with energy-efficient LED lighting, perfect for contemporary interiors.'},
                    {'path': 'assets/fan2.png', 'name': 'Vintage Whirland', 'description': 'A classic fan with antique brass finish and wooden blades, ideal for traditional and rustic settings.'},
                    {'path': 'assets/fan3.png', 'name': 'Eco Windmaster', 'description': ' An eco-friendly fan with high airflow efficiency and reversible blades for year-round comfort.'},

                  ],
                ),

                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Lamps',
                  [
                    {'path': 'assets/lamp1.png', 'name': 'Modern Desk Lamp', 'description': 'A sleek, minimalist desk lamp with a metal finish, perfect for contemporary office spaces and study areas.'},
                    {'path': 'assets/lamp2.png', 'name': 'Classic Table Lamp', 'description': 'An elegant table lamp with a traditional design, featuring a fabric shade and ornate base, ideal for living rooms or bedside tables.'},
                    {'path': 'assets/lamp3.png', 'name': 'Industrial Floor Lamp', 'description': 'A tall, industrial-style floor lamp with an exposed bulb and metal frame, adding a vintage touch to any room.'},

                  ],
                ),

                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Air Conditioner',
                  [

                    {'path': 'assets/ac2.png', 'name': 'AC Model X200', 'description': 'A high-efficiency air conditioner with a SEER rating of 20. Perfect for cooling large spaces quickly and quietly'},
                    {'path': 'assets/ac3.png', 'name': 'AC Model Y300', 'description': 'Compact and powerful, this model offers energy-saving features and a sleek design, ideal for modern homes.'},

                  ],
                ),

                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'Desk',
                  [
                    {'path': 'assets/cd1.png', 'name': 'Vintage Executive Desk', 'description': 'The Vintage Executive Desk combines elegance with functionality. Crafted from rich mahogany wood, it features intricate carvings and brass accents, exuding timeless sophistication.'},
                    {'path': 'assets/cd2.png', 'name': 'Modern Minimalist Desk', 'description': 'The Modern Minimalist Desk embodies sleek simplicity and contemporary design. Crafted from high-quality stainless steel and tempered glass, it showcases clean lines and a minimalist aesthetic. '},
                    {'path': 'assets/cd3.png', 'name': 'Rustic Farmhouse Writing Desk', 'description': 'The Rustic Farmhouse Writing Desk captures the charm of countryside living with its warm, weathered wood and vintage-inspired design. Crafted from reclaimed oak, it features a distressed finish and hand-forged iron hardware, giving it an authentic rustic appeal.'},
                    {'path': 'assets/cd4.png', 'name': 'Rustic Industrial Writing Desk', 'description': 'The Rustic Industrial Writing Desk blends rugged charm with urban sophistication. Constructed from reclaimed wood and sturdy metal, it features a weathered finish and industrial accents for a rustic yet contemporary look.'},
                    {'path': 'assets/cd5.png', 'name': 'Industrial Loft Desk', 'description': 'The Industrial Loft Desk is a fusion of vintage charm and urban flair. Crafted from a blend of reclaimed wood and metal, it showcases industrial-inspired design elements such as exposed bolts, rivets, and a distressed finish. '},
                    {'path': 'assets/cd6.png', 'name': 'Contemporary Glass-Top Desk', 'description': 'The Contemporary Glass-Top Desk is a sleek and sophisticated addition to any modern workspace. Featuring a minimalist design with a tempered glass tabletop supported by sleek metal legs, this desk exudes elegance and style-'},
                    {'path': 'assets/cd7.png', 'name': 'Classic Oak Writing Desk', 'description': 'The Classic Oak Writing Desk is a timeless piece that blends traditional elegance with functional simplicity. Crafted from solid oak wood, this desk features a rich, warm finish that highlights the natural grain of the wood. '},

                  ],
                ),


                SizedBox(height: 20),
                buildCategoryContainer(
                  context,
                  'CupBoard',
                  [
                    {'path': 'assets/cb1.png', 'name': 'Vintage Teapot', 'description': 'A charming vintage teapot adorned with delicate floral patterns, perfect for brewing aromatic teas and adding a touch of elegance to your tea time rituals.'},
                    {'path': 'assets/cb2.png', 'name': 'Ceramic Dinner Plates', 'description': 'A set of exquisite ceramic dinner plates featuring intricate designs, ideal for serving gourmet meals or adding sophistication to your dining table.'},
                    {'path': 'assets/cb3.png', 'name': 'Rustic Wooden Bowl', 'description': 'A rustic wooden bowl handcrafted from reclaimed wood, perfect for serving salads, fruits, or snacks with a rustic touch, adding warmth and natural beauty to your dining experience.'},
                    {'path': 'assets/cb4.png', 'name': 'Glass Spice Jars', 'description': 'A collection of sleek glass spice jars with air-tight lids, perfect for organizing and storing a variety of spices and herbs, keeping your kitchen tidy and your ingredients fresh.'},
                    {'path': 'assets/cb5.png', 'name': 'Vintage Silverware Set', 'description': 'An elegant vintage silverware set comprising forks, knives, and spoons with ornate detailing, adding a touch of old-world charm to your dining occasions.'},
                    {'path': 'assets/cb6.png', 'name': 'Decorative Ceramic Vases', 'description': 'A selection of decorative ceramic vases in various shapes and sizes, perfect for showcasing fresh flowers or adding artistic flair to your home decor, creating focal points of beauty in any room.'},


                  ],
                ),
              ]
                  : [
              Padding(
              padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: _onBackTap,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: Colors.white),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        Center(
          child: Column(
              children: [
          Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Transform.scale(
              scale: 0.8,
              child: Image.asset(
                _selectedImage!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                _selectedImageName!,
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        // Added rounded corner button
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Add your button action here
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color(0xFF532DE0), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('View In AR'), // Button text
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 12.0, 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _selectedImageDescription!,
              style: TextStyle(color: Colors.white60, fontSize: 16),
            ),
          ),
        ),
        // New button
        Center(
        child: ElevatedButton(
        onPressed: () {
      // Add your button action here
    },
    style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Color(0xFF532DE0), // Text color
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
      child: Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/amazon.png', width:22,height: 22),
            SizedBox(width: 8),
            Text('Available on Amazon (Rs. 3000)'),
          ],
        ),
      ),
    ),
        ),
                SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button action here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color(0xFF532DE0), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/flipkart.png', width:35,height: 35),
                          SizedBox(width: 8),
                          Text('Available on Flipkart (Rs. 2000)'),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
    ),
    ],
    ),
    Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: Container(
    decoration: BoxDecoration(
    color: Color(0xFF532DE0),
    borderRadius: const BorderRadius.only(
    bottomRight: Radius.circular(50),
    bottomLeft: Radius.circular(50),
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 3,
    blurRadius: 7,
    offset: Offset(0, 3),
    ),
    ],
    ),
    padding: EdgeInsets.only(top: 30, bottom: 20),
    child: Center(
    child: Text(
    _selectedCategory,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ),
    Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
    decoration: BoxDecoration(
    color: Color(0xFF2A2A2A), // Grey background color outside the bottom navigation bar
    ),
    child: BottomIconBar(),
    ),
    ),
    ],
    ),
    ),
    );
  }

  Widget buildCategoryContainer(BuildContext context, String title, List<Map<String, String>> items) {
    ScrollController pageScrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white54),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'More ',
                        style: TextStyle(
                          color: Color(0xFF532DE0),
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF532DE0),
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                controller: pageScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onImageTap(title, items[index]['path']!, items[index]['name']!, items[index]['description']!),
                    child: buildImageBox(items[index]['path']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageBox(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
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
