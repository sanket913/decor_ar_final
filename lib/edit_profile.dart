import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import the Fluttertoast package
import 'package:image_picker/image_picker.dart'; // Import the image_picker package

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
          'Edit Profile',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white, // Adjust text color
          ),
        ),
        centerTitle: true, // Align the title to the center
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
                          _navigateToCamera(context);
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white, // Use the provided icon color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white), // Set text color
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.white), // Set label color
                        prefixIcon: Icon(Icons.person_outline, color: Colors.white), // Set icon color
                        enabledBorder: OutlineInputBorder(
                          // Set border on all sides
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Set border color
                          borderRadius: BorderRadius.circular(100.0), // Set border radius
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white), // Set text color
                      decoration: InputDecoration(
                        labelText: 'E-Mail',
                        labelStyle: TextStyle(color: Colors.white), // Set label color
                        prefixIcon: Icon(Icons.mail_outline, color: Colors.white), // Set icon color
                        enabledBorder: OutlineInputBorder(
                          // Set border on all sides
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Set border color
                          borderRadius: BorderRadius.circular(100.0), // Set border radius
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white), // Set text color
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.white), // Set label color
                        prefixIcon: Icon(Icons.phone_outlined, color: Colors.white), // Set icon color
                        enabledBorder: OutlineInputBorder(
                          // Set border on all sides
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Set border color
                          borderRadius: BorderRadius.circular(100.0), // Set border radius
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white), // Set text color
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white), // Set label color
                        prefixIcon: Icon(Icons.fingerprint_outlined, color: Colors.white), // Set icon color
                        enabledBorder: OutlineInputBorder(
                          // Set border on all sides
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Set border color
                          borderRadius: BorderRadius.circular(100.0), // Set border radius
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showSavedSuccessfullySnackbar(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF532DE0),
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Save Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add more profile editing fields/widgets here
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () async {
                  Navigator.pop(context, await _picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () async {
                  Navigator.pop(context, await _picker.pickImage(source: ImageSource.gallery));
                },
              ),
            ],
          ),
        );
      },
    );

    if (image != null) {
      // Do something with the selected image (e.g., display it)
    }
  }

  void _showSavedSuccessfullySnackbar(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Profile Saved Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }
}
