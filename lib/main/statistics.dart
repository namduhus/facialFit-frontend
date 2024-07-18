import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import

enum ExpressionType {
  ALL,
  RAISE_EYEBROWS,
  SMILE,
  BLINK,
  PUFF_CHEEKS,
  PUCKER_LIPS,
  OPEN_MOUTH,
  SURPRISE,
  TEMP1
}

extension ExpressionTypeExtension on ExpressionType {
  String get name {
    switch (this) {
      case ExpressionType.ALL:
        return 'ALL';
      case ExpressionType.RAISE_EYEBROWS:
        return 'RAISE_EYEBROWS';
      case ExpressionType.SMILE:
        return 'SMILE';
      case ExpressionType.BLINK:
        return 'BLINK';
      case ExpressionType.PUFF_CHEEKS:
        return 'PUFF_CHEEKS';
      case ExpressionType.PUCKER_LIPS:
        return 'PUCKER_LIPS';
      case ExpressionType.OPEN_MOUTH:
        return 'OPEN_MOUTH';
      case ExpressionType.SURPRISE:
        return 'SURPRISE';
      case ExpressionType.TEMP1:
        return 'TEMP1';
      default:
        return '';
    }
  }
}

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  Future<List<Map<String, dynamic>>> fetchStatistics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    String? userId = prefs.getString('userId');

    final response = await http.get(
      Uri.parse('http://34.47.88.29:8082/api/statistics/$userId'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  ExpressionType? selectedExpressionType = ExpressionType.ALL;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchStatistics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load statistics'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No statistics available'));
          }

          List<Map<String, dynamic>> data = snapshot.data!;
          List<Map<String, dynamic>> filteredData = selectedExpressionType == ExpressionType.ALL
              ? data
              : data.where((element) => element['expressionType'] == selectedExpressionType!.name).toList();

          return Column(
            children: [
              DropdownButton<ExpressionType>(
                hint: Text("Select Expression Type"),
                value: selectedExpressionType,
                onChanged: (ExpressionType? newValue) {
                  setState(() {
                    selectedExpressionType = newValue;
                  });
                },
                items: ExpressionType.values.map((ExpressionType type) {
                  return DropdownMenuItem<ExpressionType>(
                    value: type,
                    child: Text(type.name),
                  );
                }).toList(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: BarChart(
                    BarChartData(
                      barGroups: _createBarGroups(filteredData),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text('${value.toInt()}%');
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                child: Text(
                                  filteredData[value.toInt()]['expressionType'], // 데이터에서 직접 표현식 타입을 가져옴
                                  style: TextStyle(fontSize: 5), // 글자 크기를 줄임
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups(List<Map<String, dynamic>> data) {
    final List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < data.length; i++) {
      final int successCount = data[i]['successCount'];
      final int failCount = data[i]['failCount'];
      final int totalCount = successCount + failCount;
      final double successPercent = (totalCount == 0) ? 0 : (successCount / totalCount) * 100;
      final double failPercent = (totalCount == 0) ? 0 : (failCount / totalCount) * 100;

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: successPercent,
              color: Colors.blue,
              width: 3,
            ),
            BarChartRodData(
              toY: failPercent,
              color: Colors.red,
              width: 3,
            ),
          ],
        ),
      );
    }

    return barGroups;
  }
}
