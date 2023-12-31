import 'package:flutter/material.dart';
import 'search_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Add authentication logic here
  void _login() {
    // For simplicity, let's check if both username and password are not empty
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // Navigate to the search page on successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    } else {
      // Show an error message if login fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Action for "Forgot Password" button
  void _forgotPassword() {
    // Implement the logic for password recovery
    // For example, send a password reset email to the user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Forgot Password'),
        content: const Text('Password recovery logic goes here.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/login.jpg'), // Replace with the path to your background image asset
            fit: BoxFit
                .cover, // Make the image cover the entire screen without distortion
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align content at the top
            children: [
              const SizedBox(height: 32.0), // Add space at the top
              Image.asset(
                'assets/bus.png', // Replace with the path to your image asset
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(
                  height:
                      32.0), // Increased margin between app name and welcome
              const Text(
                'Bus',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 76, 94),
                ),
              ),
              const SizedBox(
                  height:
                      75.0), // Increased margin between app name and welcome
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Welcome!',
                  textAlign: TextAlign.center, // Center the text horizontally
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 76, 94),
                    
                  ),
                ),
              ),
              const SizedBox(
                  height:
                      32.0), // Increased margin between welcome and text fields
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  fillColor: Colors.white, // Set text field background color
                  filled: true,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  fillColor: Colors.white, // Set text field background color
                  filled: true,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
              
                child: const Text('Login',style: TextStyle(
                  fontSize: 20,
                  
                ),),
              ),
              const SizedBox(height: 6.0),
              TextButton(
                onPressed: _forgotPassword,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                  color: Color.fromRGBO(35, 61, 100, 1),
                    fontSize: 20
                  ),
                ),
              ),

              const SizedBox(height: 76.0),
              const Text(
                "Don't have any account!",
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(35, 61, 100, 1),
                ),
              ),
              ElevatedButton(
                onPressed: () {  },
                child: const Text('Create New Account',
                style: (
                  TextStyle(
                    fontSize: 16
                  )
                ),),
              ),
              const SizedBox(height: 6.0),
            ],
          ),
        ),
      ),
    );
  }
}
