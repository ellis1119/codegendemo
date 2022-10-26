import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/indicator.dart';

class MainPie extends StatefulWidget {
  const MainPie({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPieState();
}

class MainPieState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius:
                        width < 1000 ? width * 0.13 : width * 0.03,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            if (width <= 1000)
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Indicator(
                      color: Colors.blueAccent,
                      text: 'First',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.cyan,
                      text: 'Second',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.orange,
                      text: 'Third',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.red,
                      text: 'Fourth',
                      isSquare: true,
                    ),
                  ],
                ),
              ),
            if (width > 1000)
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: Column(
                  children: const <Widget>[
                    Indicator(
                      color: Colors.blueAccent,
                      text: 'First',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.cyan,
                      text: 'Second',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.orange,
                      text: 'Third',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.red,
                      text: 'Fourth',
                      isSquare: true,
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.cyan,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
