import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import GoogleSignIn
import 'package:final_project/signup.dart';
import 'package:final_project/edit_profile.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import SvgPicture
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isDarkMode = false;
  bool _isTextBlack = false; // Added to track text color

  // Method to handle user logout
  void _logout(BuildContext context) async {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google
    await GoogleSignIn().signOut(); // Add this line to sign out from Google

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()), // Redirect to signup page
          (route) => false, // Clear all previous routes
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _isTextBlack = !_isTextBlack; // Toggle text color
    });
  }

  void _navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfile()), // Navigate to EditProfile page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.white : Color(0xFF2A2A2A),
      appBar: AppBar(
        backgroundColor: _isDarkMode ? Colors.white : Color(0xFF2A2A2A),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: _isTextBlack ? Colors.black : Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            'Profile',

            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: _isTextBlack ? Colors.black : Colors.white, // Adjust text color
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _toggleTheme();
            },
            icon: Icon(
              _isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_outlined,
              color: _isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: _isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage('assets/user_image.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF532DE0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _navigateToEditProfile(context);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white, // Use the provided icon color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Prajapati Sanket',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color:
                    _isTextBlack ? Colors.black : Colors.white, // Adjust text color
                  ),
                ),
              ),
              Center(
                child: Text(
                  'cybersec@gmail.com',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color:
                    _isTextBlack ? Colors.black : Colors.white, // Adjust text color
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditProfile(context);
                  },
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF532DE0),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: 'Settings',
                textColor: _isTextBlack ? Colors.black : Colors.white,
                icon: Icons.settings,
                onPress: () {},
                iconColor: _isTextBlack ? Colors.black : Colors.white,
              ),

              ProfileMenuWidget(
                title: 'Favourites',
                textColor: _isTextBlack ? Colors.black : Colors.white,
                icon: Icons.favorite_border_outlined,
                onPress: () {},
                iconColor: _isTextBlack ? Colors.black : Colors.white,
              ),

              ProfileMenuWidget(
                title: 'My Spaces',
                textColor: _isTextBlack ? Colors.black : Colors.white,
                icon: Icons.design_services_outlined,
                onPress: () {},
                iconColor: _isTextBlack ? Colors.black : Colors.white,
              ),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Log Out',
                icon: Icons.logout_outlined,
                onPress: () {
                  _logout(context);
                },
                textColor: Colors.red,
                iconColor: _isTextBlack ? Colors.black : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    required this.iconColor, // New parameter for icon color
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final Color iconColor; // New parameter for icon color

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: iconColor, // Use the provided icon color
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: textColor ??
              (textColor == Colors.white ? textColor : Colors.white),
          // Adjust text color
          fontSize: 18.0,
        ),
      ),
      trailing: endIcon
          ? Container(
        width: 30,
        height: 30,
        child: Icon(
          CupertinoIcons.forward,
          size: 18.0,
          color: iconColor, // Use the provided icon color
        ),
      )
          : null,
    );
  }
}
