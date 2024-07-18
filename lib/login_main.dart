import 'package:SmileHelper/register_main.dart';
import 'package:flutter/material.dart';
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
    return BaseScreen(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // 화면 높이에 맞추도록 설정
          child: Center(
            child: Container(
              width: 424,
              height: 805,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Text(
                        'Login',
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        colors: [Color(0xFF87CEEB), Color(0xFFFFFFFF)],
                        ),
                          borderRadius: BorderRadius.circular(15),
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF87CEEB), Color(0xFFFFFFFF)],
                        ),
                        borderRadius: BorderRadius.circular(15),
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
                          color: Color(0xFF87CEEB),
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
      ),
    );
  }
}
