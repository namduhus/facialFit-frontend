import 'package:flutter/material.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

class Survey extends StatefulWidget {
  final Map<String, dynamic> registrationData;

  const Survey({Key? key, required this.registrationData}) : super(key: key);

  @override
  SurveyState createState() => SurveyState();
}

class SurveyState extends State<Survey> {
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;
  bool answer5 = false;
  bool answer6 = false;

  void _submitSurvey() {
    final surveyData = {
      ...widget.registrationData,
      'surveyAnswers': {
        'subwayQuestion1': answer1,
        'subwayQuestion2': answer2,
        'subwayQuestion3': answer3,
        'subwayQuestion4': answer4,
        'subwayQuestion5': answer5,
        'subwayQuestion6': answer6,
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
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.pop(context, surveyData); // 설문조사 데이터와 함께 이전 화면으로 이동
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
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Survey',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFF3F3),
                    fontSize: 50,
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              _buildQuestion(
                '1. Are you a patient diagnosed with facial paralysis?',
                'Yes',
                'No',
                answer1,
                    (bool value) {
                  setState(() {
                    answer1 = value;
                    if (answer1) {
                      answer2 = false;
                    }
                  });
                },
              ),
              _buildQuestion(
                '2. Do you notice any weakness or unevenness in your facial muscles?',
                'Yes',
                'No',
                answer2,
                    (bool value) {
                  setState(() {
                    answer2 = value;
                    if (answer2) {
                      answer1 = true;
                    }
                  });
                },
              ),
              _buildQuestion(
                '3. Can you comfortably close your eyes?',
                'Yes',
                'No',
                answer3,
                    (bool value) {
                  setState(() {
                    answer3 = value;
                    if (answer3) {
                      answer4 = false;
                    }
                  });
                },
              ),
              _buildQuestion(
                '4. Can you open your mouth without difficulty?',
                'Yes',
                'No',
                answer4,
                    (bool value) {
                  setState(() {
                    answer4 = value;
                    if (answer4) {
                      answer3 = true;
                    }
                  });
                },
              ),
              _buildQuestion(
                "5. Is there any noticeable lack of movement or drooping when your face is at rest?",
                'Yes',
                'No',
                answer5,
                    (bool value) {
                  setState(() {
                    answer5 = value;
                    if (answer5) {
                      answer6 = false;
                    }
                  });
                },
              ),
              _buildQuestion(
                "6. Does one side of your face fail to move at all?",
                'Yes',
                'No',
                answer6,
                    (bool value) {
                  setState(() {
                    answer6 = value;
                    if (answer6) {
                      answer5 = true;
                    }
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitSurvey,
                child: Text('Finish Survey'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(
      String question,
      String option1,
      String option2,
      bool isChecked,
      ValueChanged<bool> onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _buildCheckBox(option1, isChecked, onChanged),
            SizedBox(width: 10),
            Text(option1, style: TextStyle(color: Colors.white)),
            SizedBox(width: 20),
            _buildCheckBox(option2, !isChecked, (value) => onChanged(!value)),
            SizedBox(width: 10),
            Text(option2, style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCheckBox(
      String option, bool isChecked, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: isChecked
            ? Center(
          child: Icon(Icons.check, size: 16, color: Colors.white),
        )
            : SizedBox(),
      ),
    );
  }
}
