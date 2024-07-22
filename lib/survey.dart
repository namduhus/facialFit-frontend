import 'package:flutter/material.dart';
import 'package:SmileHelper/css/screen.dart';

class Survey extends StatefulWidget {
  final Map<String, dynamic> registrationData;

  const Survey({Key? key, required this.registrationData}) : super(key: key);

  @override
  SurveyState createState() => SurveyState();
}

class SurveyState extends State<Survey> {
  List<bool> answers = List.filled(6, false);

  void _submitSurvey() {
    final surveyData = {
      ...widget.registrationData,
      'surveyAnswers': {
        for (int i = 0; i < 6; i++) 'subwayQuestion${i + 1}': answers[i],
      },
    };

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Completed Survey'),
          content: Text('Thank you for responding to our survey.'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context, surveyData);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 380,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
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
                children: [
                  SizedBox(
                    width: 180,
                    height: 70,
                    child: Text(
                      'Survey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ...List.generate(6, (index) => _buildQuestion(index)),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _submitSurvey,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B4513),
                      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                      textStyle: TextStyle(fontSize: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Submit Survey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
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

  Widget _buildQuestion(int index) {
    String question;
    switch (index) {
      case 0:
        question = '1. Are you a patient diagnosed with facial paralysis?';
        break;
      case 1:
        question = '2. Do you notice any weakness or unevenness in your facial muscles?';
        break;
      case 2:
        question = '3. Can you comfortably close your eyes?';
        break;
      case 3:
        question = '4. Can you open your mouth without difficulty?';
        break;
      case 4:
        question = "5. Is there any noticeable lack of movement or drooping when your face is at rest?";
        break;
      case 5:
        question = "6. Does one side of your face fail to move at all?";
        break;
      default:
        question = '';
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _buildOptionButton('Yes', index, true),
              ),
              Expanded(
                child: _buildOptionButton('No', index, false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String label, int index, bool value) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        child: Text(label),
        style: ElevatedButton.styleFrom(
          foregroundColor: answers[index] == value ? Colors.white : Color(0xFF8B4513), backgroundColor: answers[index] == value ? Color(0xFF8B4513) : Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(fontSize: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xFF8B4513)),
          ),
        ),
        onPressed: () {
          setState(() {
            answers[index] = value;
          });
        },
      ),
    );
  }
}