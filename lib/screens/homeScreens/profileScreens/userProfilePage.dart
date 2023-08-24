import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/data/userInfo.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Basic Info Title:

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    Provider.of<UserInfo>(context).getUserInfo.firstName! +
                        ' ' +
                        Provider.of<UserInfo>(context).getUserInfo.lastName!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    Provider.of<UserInfo>(context).getUserInfo.email!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Role',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    //Capitalise the first letter of the role
                    Provider.of<UserInfo>(context)
                            .getUserInfo
                            .role!
                            .substring(0, 1)
                            .toUpperCase() +
                        Provider.of<UserInfo>(context)
                            .getUserInfo
                            .role!
                            .substring(1),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SizedBox(height: 16),
          //Assessment history title:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AssessmentHistory(),
          ),
          Visibility(
            visible:
                //Provider.of<UserInfo>(context).getUserInfo.role == 'student',
                false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Badges and Achievements',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Showcase badges earned by students
          Visibility(
            visible:
                //Provider.of<UserInfo>(context).getUserInfo.role == 'student',
                false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildBadge('Gold', Icons.emoji_events)),
                Expanded(child: _buildBadge('Silver', Icons.emoji_events)),
                Expanded(child: _buildBadge('Bronze', Icons.emoji_events)),
                Expanded(
                    child:
                        _buildBadge('Golf Player', Icons.golf_course_rounded)),
                Expanded(
                    child:
                        _buildBadge('Golf Player', Icons.golf_course_rounded)),
              ],
            ),
          ),
          Visibility(
            visible:
                //Provider.of<UserInfo>(context).getUserInfo.role == 'student',
                false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Progress Over Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Graphical representation of performance over time
          Visibility(
            visible:
                //Provider.of<UserInfo>(context).getUserInfo.role == 'student',
                false,
            child: Row(
              children: [
                Expanded(child: _buildPerformanceGraph()),
                Expanded(child: _buildPerformanceGraph()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 48,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceGraph() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              );
            },
            drawVerticalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.transparent,
                strokeWidth: 0,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: false,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: (value, _title) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        'Jan',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 1:
                      return Text(
                        'Feb',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 2:
                      return Text(
                        'Mar',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 3:
                      return Text(
                        'Apr',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 4:
                      return Text(
                        'May',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 5:
                      return Text(
                        'Jun',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 6:
                      return Text(
                        'Jul',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 7:
                      return Text(
                        'Aug',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 8:
                      return Text(
                        'Sep',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 9:
                      return Text(
                        'Oct',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 10:
                      return Text(
                        'Nov',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 11:
                      return Text(
                        'Dec',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );

                    default:
                      return Text(
                        '',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _title) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        '0%',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 25:
                      return Text(
                        '25%',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 50:
                      return Text(
                        '50%',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 75:
                      return Text(
                        '75%',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    case 100:
                      return Text(
                        '100%',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                  }
                  return Text(
                    '',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 10),
                FlSpot(1, 20),
                FlSpot(2, 30),
                FlSpot(3, 40),
                FlSpot(4, 50),
                FlSpot(5, 60),
                FlSpot(6, 70),
                FlSpot(7, 80),
                FlSpot(8, 90),
                FlSpot(9, 100),
                FlSpot(10, 90),
                FlSpot(11, 80),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssessmentHistory extends StatelessWidget {
  const AssessmentHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Text(
            'Assessment History',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<UserInfo>(context).getAssessments.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.assessment,
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<UserInfo>(context)
                                  .getAssessments[index]
                                  .name!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Topic: '
                              // Provider.of<UserInfo>(context)
                              //     .getAssessments[index]
                              //     .topic!
                              //     .name!,
                              ,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Score: ' + '%' + 'Date',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.refresh),
                            color: Colors.white,
                            onPressed: () {
                              // Retake assessment
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                            onPressed: () {
                              // Review assessment
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
