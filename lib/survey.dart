import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 없애기
        title: Image.asset(
          'assets/images/Logo.png',
          height: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF207F66),
          child: Center(
            child: Container(
              width: 424,
              decoration: BoxDecoration(
                color: Color(0xFF48AA7B),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
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
                    SizedBox(height: 35),
                    _buildQuestion(
                      '1. Are you a facial paralysis patient?',
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
                      '2. Do you have any symptoms of muscle weakness and asymmetry in your face?',
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
                      '3. Can you close your eyes comfortably?',
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
                      '4. Can you open your mouth?',
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
                      "5. Doesn't it move when you are expressionless?",
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
                      "6. Doesn't your half face move at all?",
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
