import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  SurveyState createState() => SurveyState();
}

class SurveyState extends State<Survey> {
  // 각 질문의 선택 상태를 관리하는 변수들
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;
  bool answer5 = false;
  bool answer6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: Container(
        color: Color(0xFF207F66),
        child: Center(
          child: Container(
            width: 424,
            height: 805,
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
                      '설문조사',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFF3F3),
                        fontSize: 28,
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildQuestion(
                    '1. 안면마비 환자이신가요?',
                    '예',
                    '아니오',
                    answer1,
                        (bool value) {
                      setState(() {
                        answer1 = value;
                        if (answer1) {
                          // '예' 선택 시 다른 선택들을 false로 설정하여 하나의 선택만 가능하게 합니다.
                          answer2 = true;
                        }
                      });
                    },
                  ),
                  _buildQuestion(
                    '2. 얼굴의 근력저하와 비대칭 증상이 있나요?',
                    '예',
                    '아니오',
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
                    '3. 뚜렷한 근력저하와 비대칭이 보이고, 힘을 줘야 눈감기가 가능하나요?',
                    '예',
                    '아니오',
                    answer3,
                        (bool value) {
                      setState(() {
                        answer3 = value;
                        if (answer3) {
                          answer4 = true;
                        }
                      });
                    },
                  ),
                  _buildQuestion(
                    '4. 이마주름이 안잡히고, 눈이 완전히 감기지 않나요?',
                    '예',
                    '아니오',
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
                    '5. 무표정일 때 완전히 비대칭이고, 안움직여지나요?',
                    '예',
                    '아니오',
                    answer5,
                        (bool value) {
                      setState(() {
                        answer5 = value;
                        if (answer5) {
                          answer6 = true;
                        }
                      });
                    },
                  ),
                  _buildQuestion(
                    '6. 반쪽얼굴이 아예 움직이지 않고, 피부가 쳐저 보이나요?',
                    '예',
                    '아니오',
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
                    onPressed: () {
                      // 설문조사 완료 처리 함수
                      _completeSurvey(context);
                    },
                    child: Text('설문조사 완료'),
                  ),
                ],
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

  Widget _buildCheckBox(String option, bool isChecked, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () {
        // 체크 상태를 토글합니다
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
            : SizedBox(), // isChecked가 true이면 체크 마크를 표시합니다
      ),
    );
  }

  void _completeSurvey(BuildContext context) {
    // 설문조사 완료 처리를 여기에 구현합니다
    // 예를 들어, 다른 화면으로 이동하거나 설문 결과를 서버에 제출하는 등의 작업을 수행할 수 있습니다
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('설문조사 완료'),
          content: Text('설문조사에 응해 주셔서 감사합니다.'),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.of(context).pop(); // 이전 화면으로 이동
              },
            ),
          ],
        );
      },
    );
  }
}

