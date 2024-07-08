import 'package:SmileHelper/register_main.dart';
import 'package:flutter/material.dart';
import 'package:SmileHelper/Service/AuthService.dart'; // Import AuthService
import 'package:SmileHelper/main/stage.dart'; // Import your MainStage screen
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainStage()),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Smile-Helper'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 196,
                    height: 67,
                    child: Text(
                      '   Login',
                      style: TextStyle(
                        color: Color(0xFFFFF3F3),
                        fontSize: 51.53,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
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
                        labelText: 'Id',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
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
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF48AA7B),
                        fontSize: 35,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Navigate to Register2 screen or any other registration screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterMain()),
                      );
                    },
                    child: Text('Create an account'),
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
