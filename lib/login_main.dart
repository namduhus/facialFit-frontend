import 'package:flutter/material.dart';
import 'package:SmileHelper/register_main.dart';
import 'package:SmileHelper/Service/AuthService.dart'; // AuthService import
import 'package:SmileHelper/main/main_stage.dart'; // MainStage2 screen import
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  LoginMainState createState() => LoginMainState();
}

class LoginMainState extends State<LoginMain> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final AuthService _authService = AuthService(); // Instantiate AuthService

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.login(_idController.text, _passwordController.text);

      setState(() {
        _isLoading = false;
      });

      // Navigate to MainStage screen or any other screen after successful login
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MainHome()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      // Show error dialog for failed login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 364,
            constraints: BoxConstraints(
              minHeight: height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 70,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
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
                        labelText: 'Id',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B4513),
                      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
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
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      // Navigate to Register2 screen or any other registration screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterMain()),
                      );
                    },
                    child: Text(
                      'Create an account',
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
    );
  }
}