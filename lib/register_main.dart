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
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 364,
            constraints: BoxConstraints(
              minHeight: height - MediaQuery
                  .of(context)
                  .padding
                  .top - MediaQuery
                  .of(context)
                  .padding
                  .bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.white, // 배경색을 흰색으로 변경
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 70,
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // Spacing after the title
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _idController,
                        style: TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'ID',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your ID';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15), // 간격 조정
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _nicknameController,
                        style: TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Nickname',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your nickname';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15), // 간격 조정
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        style: TextStyle(fontSize: 24),
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15), // 간격 조정
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: _ageController,
                        style: TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.cake),
                          labelText: 'Age',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
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
                    SizedBox(height: 15), // 간격 조정
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.local_hospital),
                          labelText: 'Health Area',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
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
                    SizedBox(height: 15), // 간격 조정
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.report),
                          labelText: 'Severity Level',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
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
                    SizedBox(height: 15), // 간격 조정
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black26),
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
                        activeColor: Color(0xFF8B4513),
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // 간격 조정
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Survey(registrationData: {})),
                        );
                        // Handle survey result if needed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                        textStyle: TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Color(0xFF8B4513), width: 2),
                        ),
                      ),
                      child: Text(
                        'Go to Survey',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8B4513),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // 간격 조정
                    ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                        if (_formKey.currentState!.validate() &&
                            _termsAccepted) {
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8B4513),
                        padding: EdgeInsets.symmetric(
                            horizontal: 55, vertical: 15),
                        textStyle: TextStyle(fontSize: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // 간격 조정
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginMain()),
                        );
                      },
                      child: Text(
                        'Already have an account? Log in',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF8B4513),
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
    );
  }
}