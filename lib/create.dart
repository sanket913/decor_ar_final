import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast
import 'package:final_project/service/database.dart'; // Import DatabaseMethods
import 'package:final_project/dashboard.dart';
import 'package:final_project/option.dart';// Import the dashboard page

class CreateUserPage extends StatefulWidget {
  final String? googleName;
  final String? googleEmail;
  final String? phoneNumber;

  const CreateUserPage({Key? key, this.googleName, this.googleEmail, this.phoneNumber}) : super(key: key);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // DatabaseMethods instance
  DatabaseMethods databaseMethods = DatabaseMethods();

  // FocusNode for password field
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Autofill the fields if signing up with Google
    nameController.text = widget.googleName ?? "";
    emailController.text = widget.googleEmail ?? "";
    phoneController.text = widget.phoneNumber ?? "+91"; // Set default value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2A2A), // Set background color
      appBar: AppBar(
        title: Text("Create User", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF2A2A2A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  _validatePassword(value);
                },
              ),
              SizedBox(height: 5),
              Visibility(
                visible: _isPasswordValid(passwordController.text),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.",
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: phoneController,
                enabled: true,
                keyboardType: TextInputType.phone,// Disable editing
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Call addUser method when button is pressed
                  addUserToDatabase();
                },
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF532DE0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to validate password strength
  void _validatePassword(String value) {
    setState(() {});
  }

  // Check if password is valid
  bool _isPasswordValid(String password) {
    // Password strength criteria
    RegExp passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={}\[\]|;:,.<>?]).{8,}$');
    return !passwordRegex.hasMatch(password);
  }

  // Method to add user details to the database
  void addUserToDatabase() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String phone = phoneController.text.trim();

    // Validate input fields before adding to database
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        phone.isNotEmpty) {
      // Check if passwords match
      if (password != confirmPassword) {
        _showSnackbar("Passwords do not match");
        return;
      }

      // Check if phone number is valid
      if (phone.length != 13) {
        _showSnackbar("Phone number should be +91 followed by 10 digits");
        return;
      }

      // Assume the addUser method succeeds, then navigate to dashboard page and show toast message
      Fluttertoast.showToast(
        msg: "Account Created Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Option()), // Navigate to dashboard page
      );
    } else {
      _showSnackbar("All fields are required");
    }
  }

  // Method to show snackbar with a message
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
