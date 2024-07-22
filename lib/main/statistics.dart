import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:SmileHelper/css/screen.dart'; // BaseScreen import
import 'package:shimmer/shimmer.dart'; // Shimmer effect

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

  Future<List<DateStatistics>> fetchGroupedStatistics(ExpressionType expressionType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    String? userId = prefs.getString('userId');

    final response = await http.get(
      Uri.parse('http://34.47.88.29:8082/api/statistics/$userId/accumulated/${expressionType.name}'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => DateStatistics.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load grouped statistics');
    }
  }

  ExpressionType? selectedExpressionType = ExpressionType.ALL;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          Expanded(
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
                List<Map<String, dynamic>> filteredData = selectedExpressionType ==
                    ExpressionType.ALL
                    ? data
                    : data.where((element) =>
                element['expressionType'] == selectedExpressionType!.name).toList();

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
          ),
        ],
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
              if (selectedExpressionType != ExpressionType.ALL) ...[
                SizedBox(height: 10),
                FutureBuilder<List<DateStatistics>>(
                  future: fetchGroupedStatistics(selectedExpressionType!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Failed to load grouped statistics'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No grouped statistics available'));
                    }

                    List<DateStatistics> data = snapshot.data!;

                    // If the data is too small, add some dummy points to make the graph visible
                    if (data.length == 1) {
                      data.add(DateStatistics(
                        date: data[0].date.add(Duration(days: 1)),
                        cumulativeSuccessCount: data[0].cumulativeSuccessCount,
                        cumulativeFailCount: data[0].cumulativeFailCount,
                        successRate: data[0].successRate,
                      ));
                    } else if (data.length == 2) {
                      data.add(DateStatistics(
                        date: data[1].date.add(Duration(days: 1)),
                        cumulativeSuccessCount: data[1].cumulativeSuccessCount,
                        cumulativeFailCount: data[1].cumulativeFailCount,
                        successRate: data[1].successRate,
                      ));
                    }

                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            DateFormat('MMMM').format(data.first.date),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 200,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 28,
                                      interval: 0.1,
                                      getTitlesWidget: (value, meta) {
                                        if (value % 0.1 == 0) {
                                          return Text(
                                            '${(value * 100).toInt()}%',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false), // Hide right titles
                                  ),
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false), // Hide top titles
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        int index = value.toInt();
                                        if (index >= 0 && index < data.length) {
                                          return SideTitleWidget(
                                            axisSide: meta.axisSide,
                                            child: Text(
                                              DateFormat('dd').format(data[index].date),
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: _createSpots(data),
                                    isCurved: true,
                                    barWidth: 2,
                                    color: Colors.brown,
                                  ),
                                ],
                                lineTouchData: LineTouchData(
                                  touchTooltipData: LineTouchTooltipData(
                                    tooltipBgColor: Colors.blueGrey,
                                  ),
                                  touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {},
                                  handleBuiltInTouches: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem(Colors.blue, 'Success'),
                  SizedBox(width: 10),
                  _buildLegendItem(Colors.red, 'Fail'),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 5),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
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
        titleStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        value: failPercent,
        color: Colors.red,
        title: '${failPercent.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }

  LineChartData _createLineChartData(Map<String, dynamic> data) {
    List<FlSpot> spots = [];

    for (int i = 0; i < 14; i++) {
      String key = 'day${i + 1}';
      if (data.containsKey(key)) {
        double successRate = data[key]['successCount'] /
            (data[key]['successCount'] + data[key]['failCount']);
        spots.add(FlSpot(i.toDouble(), successRate));
      }
    }
    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 0.1,
            getTitlesWidget: (value, meta) {
              if (value % 0.1 == 0) {
                return Text(
                  '${(value * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide right titles
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Hide top titles
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              if (index >= 0 && index < data.length) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    DateFormat('dd').format(data[index].date),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 2,
          color: Colors.brown,
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
        ),
        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {},
        handleBuiltInTouches: true,
      ),
    );
  }

  List<Widget> _buildLineChart(List<DateStatistics> data) {
    if (data.isEmpty) {
      return [Text('No data available for the selected expression type.')];
    }

    return [
      Container(
          height: 200,
          child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 0.1,
                      getTitlesWidget: (value, meta) {
                        if (value % 0.1 == 0) {
                          return Text(
                            '${(value * 100).toInt()}%',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false), // Hide right titles
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false), // Hide top titles
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < data.length) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              DateFormat('dd').format(data[index].date),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: _createSpots(data),
                    isCurved: true,
                    barWidth: 2,
                    color: Colors.brown,
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.blueGrey,
                  ),
                  touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {},
                  handleBuiltInTouches: true,
                ),
              )
          )
      ),
    ];
  }

  List<FlSpot> _createSpots(List<DateStatistics> data) {
    // Ensure no duplicates
    Set<DateTime> uniqueDates = {};
    List<DateStatistics> uniqueData = [];

    for (var dateStat in data) {
      if (!uniqueDates.contains(dateStat.date)) {
        uniqueDates.add(dateStat.date);
        uniqueData.add(dateStat);
      }
    }

    // If the data is too small, add some dummy points to make the graph visible
    if (uniqueData.length == 1) {
      uniqueData.add(DateStatistics(
        date: uniqueData[0].date.add(Duration(days: 1)),
        cumulativeSuccessCount: uniqueData[0].cumulativeSuccessCount,
        cumulativeFailCount: uniqueData[0].cumulativeFailCount,
        successRate: uniqueData[0].successRate,
      ));
    } else if (uniqueData.length == 2) {
      uniqueData.add(DateStatistics(
        date: uniqueData[1].date.add(Duration(days: 1)),
        cumulativeSuccessCount: uniqueData[1].cumulativeSuccessCount,
        cumulativeFailCount: uniqueData[1].cumulativeFailCount,
        successRate: uniqueData[1].successRate,
      ));
    }

    List<FlSpot> spots = [];
    for (int i = 0; i < uniqueData.length && i < 14; i++) {
      spots.add(FlSpot(i.toDouble(), uniqueData[i].successRate));
    }
    return spots;
  }

  void main() {
    runApp(MaterialApp(
      home: StatisticsPage(),
    ));
  }
}

class DateStatistics {
  final DateTime date;
  final int cumulativeSuccessCount;
  final int cumulativeFailCount;
  final double successRate;

  DateStatistics({
    required this.date,
    required this.cumulativeSuccessCount,
    required this.cumulativeFailCount,
    required this.successRate,
  });

  factory DateStatistics.fromJson(Map<String, dynamic> json) {
    return DateStatistics(
      date: DateTime.parse(json['date']),
      cumulativeSuccessCount: json['cumulativeSuccessCount'],
      cumulativeFailCount: json['cumulativeFailCount'],
      successRate: json['successRate'],
    );
  }
}

class Statistics {
  final String expressionType;
  final int successCount;
  final int failCount;

  Statistics({required this.expressionType, required this.successCount, required this.failCount});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      expressionType: json['expressionType'],
      successCount: json['successCount'],
      failCount: json['failCount'],
    );
  }
}