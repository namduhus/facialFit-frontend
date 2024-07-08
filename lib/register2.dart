import 'package:flutter/material.dart';
import 'package:SmileHelper/login.dart';
import 'package:SmileHelper/survey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<Register2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  bool _termsAccepted = false;
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://your-api-url.com/api/join/join'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': _idController.text,
          'username': _userIdController.text,
          'password': _passwordController.text,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        // Registration successful, navigate to login screen or handle as needed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        // Registration failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to register. Please try again.'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        color: Color(0xFF207F66),
        child: Center(
          child: Container(
            width: 424,
            height: 805,
            decoration: ShapeDecoration(
              color: Color(0xFF48AA7B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 196,
                        height: 67,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFFFFF3F3),
                            fontSize: 51.53,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 40), // Spacing after the logo
                      Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: _idController,
                          decoration: InputDecoration(
                            labelText: 'ID',
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                // Implement ID check logic here
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ID';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: _userIdController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: CheckboxListTile(
                          title: Text('I agree to the terms and conditions'),
                          value: _termsAccepted,
                          onChanged: (bool? value) {
                            setState(() {
                              _termsAccepted = value ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Survey()),
                          );
                          // Handle survey result if needed
                        },
                        child: Text('Go to Survey'),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                          if (_formKey.currentState!.validate() &&
                              _termsAccepted) {
                            _register();
                          } else if (!_termsAccepted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                Text('You must accept the terms and conditions'),
                              ),
                            );
                          }
                        },
                        child: _isLoading
                            ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFF48AA7B),
                            fontSize: 35,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}