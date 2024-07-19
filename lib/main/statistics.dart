import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import
import 'package:shimmer/shimmer.dart'; // Shimmer effect
import 'package:animated_button/animated_button.dart'; // Animated Button

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

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildDropdown(),
                  SizedBox(height: 20),
                  ..._buildStatisticsCards(filteredData),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButton<ExpressionType>(
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
    );
  }

  List<Widget> _buildStatisticsCards(List<Map<String, dynamic>> data) {
    return data.map((item) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Color(0xFF8B4513),
                highlightColor: Color(0xFFD2691E),
                child: Text(
                  item['expressionType'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: _createPieSections(item),
                    centerSpaceRadius: 40,
                    sectionsSpace: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  List<PieChartSectionData> _createPieSections(Map<String, dynamic> data) {
    final int successCount = data['successCount'];
    final int failCount = data['failCount'];
    final int totalCount = successCount + failCount;

    final double successPercent = (totalCount == 0) ? 0 : (successCount / totalCount) * 100;
    final double failPercent = (totalCount == 0) ? 0 : (failCount / totalCount) * 100;

    return [
      PieChartSectionData(
        value: successPercent,
        color: Colors.blue,
        title: '${successPercent.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        value: failPercent,
        color: Colors.red,
        title: '${failPercent.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}

void main() {
  runApp(MaterialApp(
    home: StatisticsPage(),
  ));
}