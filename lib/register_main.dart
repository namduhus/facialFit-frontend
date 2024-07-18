import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:SmileHelper/login_main.dart';
import 'package:SmileHelper/survey.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class RegisterMain extends StatefulWidget {
  const RegisterMain({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterMain> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _selectedHealthArea;
  String? _selectedSeverityLevel;
  bool _termsAccepted = false;
  bool _isLoading = false;

  final List<String> healthAreas = [
    'LEFT_FACE',
    'RIGHT_FACE',
    'FOREHEAD',
    'MOUTH',
    'EYE',
    'CHEEK'
  ];

  final List<String> severityLevels = ['MILD', 'MODERATE', 'SEVERE'];

  Future<bool> _checkIdAvailability(String id) async {
    try {
      final response = await http.get(
        Uri.parse('http://34.47.88.29:8082/api/join/check/id?id=$id'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse as bool; // Assuming backend returns a boolean directly
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final bool idAvailable = await _checkIdAvailability(_idController.text);

      if (!idAvailable) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'The ID is already taken. Please choose another one.'),
          ),
        );
        return;
      }

      final response = await http.post(
        Uri.parse('http://34.47.88.29:8082/api/join/join'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': _idController.text,
          'nickname': _nicknameController.text,
          'password': _passwordController.text,
          'age': int.parse(_ageController.text),
          'healthArea': _selectedHealthArea!.toUpperCase(),
          'severityLevel': _selectedSeverityLevel!.toUpperCase(),
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 201) {
        // Registration successful, navigate to login screen or handle as needed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginMain()),
        );
      } else {
        // Registration failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to register. Status code: ${response
                .statusCode}, ${response.body}'),
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
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 80,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFFFFF3F3),
                      fontSize: 45,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 40), // Spacing after the logo
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () async {
                          // Check ID availability
                          final isAvailable = await _checkIdAvailability(
                              _idController.text);
                          if (!isAvailable) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'The ID is already taken. Please choose another one.'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('The ID is available.'),
                              ),
                            );
                          }
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _nicknameController,
                    decoration: InputDecoration(
                      labelText: 'Nickname',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your nickname';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Health Area',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                    ),
                    value: _selectedHealthArea,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedHealthArea = newValue;
                      });
                    },
                    items: healthAreas
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a health area';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Severity Level',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                    ),
                    value: _selectedSeverityLevel,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedSeverityLevel = newValue;
                      });
                    },
                    items: severityLevels
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a severity level';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF87CEEB),
                        Color(0xFFFFFFFF)
                      ], // 수평 그라데이션
                    ),
                    borderRadius: BorderRadius.circular(15),
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
                    activeColor: Color(0xFF87CEEB),
                    checkColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Survey(registrationData: {},)),
                    );
                    // Handle survey result if needed
                  },
                  child: Text('Go to Survey'),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                    if (_formKey.currentState!.validate() && _termsAccepted) {
                      // Check ID availability
                      final isAvailable = await _checkIdAvailability(
                          _idController.text);
                      if (!isAvailable) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'The ID is already taken. Please choose another one.'),
                          ),
                        );
                      } else {
                        // Proceed with registration
                        _register();
                      }
                    } else if (!_termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'You must accept the terms and conditions'),
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
                      color: Color(0xFF87CEEB),
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
    );
  }
}
