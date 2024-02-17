import 'package:demo_ui/charts/LineChart.dart';
import 'package:demo_ui/charts/PricePoints.dart';
import 'package:demo_ui/provider/app_provider.dart';
import 'package:demo_ui/screens/Main%20Screen/Student/students_page.dart';
import 'package:demo_ui/src/pages/home_page.dart';
import 'package:demo_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/batch_model.dart';
import '../../../models/students_model.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverviewContent(),
    );
  }
}

class IconButtonColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const IconButtonColumn({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30.0, color: pColor),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(color: pColor)),
        ],
      ),
    );
  }
}

class OverviewContent extends StatelessWidget {
  @override
  int count = 0;

  OverviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: pColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 80,
                // Adjust the height to accommodate text
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                // Add padding
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 8),
                    IconButtonColumn(
                      icon: Icons.home,
                      text: 'Overview',
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         const OverviewPage(), // Navigate to SecondScreen
                        //   ),
                        // ); // Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()));
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButtonColumn(
                      icon: Icons.people,
                      text: 'Students',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentsPage()));
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButtonColumn(
                      icon: Icons.list,
                      text: 'Batches',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BatchesPage()));
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButtonColumn(
                      icon: Icons.assignment,
                      text: 'Exams',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExamsPage()));
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButtonColumn(
                      icon: Icons.chat,
                      text: 'Enquiries',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnquiriesPage()));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: pColor,
                  width: 1,
                ))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        shadowColor: pColor,
                        margin: const EdgeInsets.only(top: 2),
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 25, right: 25),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.school,
                                    color: pColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Student",
                                    style:
                                        TextStyle(fontSize: 17, color: pColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FutureBuilder<Student?>(
                                  future: provider.getStudents(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (!snapshot.hasData &&
                                        provider.students.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          'No data available.',
                                          style: TextStyle(color: pColor),
                                        ),
                                      );
                                    } else {
                                      return Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                provider.students.length
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: pColor),
                                              ),
                                              const Text(
                                                "Active",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: pColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 26,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "$count",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: pColor),
                                              ),
                                              const Text(
                                                "Close",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: pColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shadowColor: pColor,
                        margin: const EdgeInsets.only(top: 2),
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 25, right: 25),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: pColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Batches",
                                      style: TextStyle(
                                          fontSize: 17, color: pColor)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FutureBuilder<BatchModel?>(
                                  future: provider.getBatches(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (!snapshot.hasData &&
                                        provider.batches.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          'No data available.',
                                          style: TextStyle(color: pColor),
                                        ),
                                      );
                                    }
                                    else{
                                      return  Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                provider.batches.length.toString(),
                                                style: const TextStyle(
                                                    fontSize: 17, color: pColor),
                                              ),
                                              const Text(
                                                "Active",
                                                style: TextStyle(
                                                    fontSize: 15, color: pColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 26,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "$count",
                                                style: const TextStyle(
                                                    fontSize: 17, color: pColor),
                                              ),
                                              const Text(
                                                "Close",
                                                style: TextStyle(
                                                    fontSize: 15, color: pColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                  }),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: pColor,
                  width: 1,
                ))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Students Attendance",
                                style: TextStyle(fontSize: 17, color: pColor),
                              ),
                              Icon(
                                Icons.open_in_new,
                                color: pColor,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 250,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: pColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "100%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "10/10",
                            style: TextStyle(
                              color: pColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: pColor,
                  width: 1,
                ))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: pColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Attendance Chart",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Mooli'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shadowColor: pColor,
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: LineChartWidget(
                            points: pricePoints,
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 300,
                      //   height: 300,
                      //   child: buildAttendanceChart(),
                      //
                      // )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: pColor,
                  width: 1,
                ))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.school,
                                color: pColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Exams",
                                style: TextStyle(fontSize: 17, color: pColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      provider.examsMap.length.toString(),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    const Text(
                                      "Total Exams",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 26,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$count",
                                      style: const TextStyle(
                                          fontSize: 17, color: pColor),
                                    ),
                                    const Text(
                                      "Today Exams",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 26,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$count",
                                      style: const TextStyle(
                                          fontSize: 17, color: pColor),
                                    ),
                                    const Text(
                                      "This Month",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: pColor,
                  width: 1,
                ))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.school,
                                color: pColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Enquiry",
                                style: TextStyle(fontSize: 17, color: pColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "$count",
                                      style: const TextStyle(
                                          fontSize: 17, color: pColor),
                                    ),
                                    const Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$count",
                                      style: const TextStyle(
                                          fontSize: 17, color: pColor),
                                    ),
                                    const Text(
                                      "Active",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$count",
                                      style: const TextStyle(
                                          fontSize: 17, color: pColor),
                                    ),
                                    const Text(
                                      "Close",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$count",
                                      style: const TextStyle(
                                          fontSize: 17, color: pColor),
                                    ),
                                    const Text(
                                      "Close",
                                      style: TextStyle(
                                          fontSize: 15, color: pColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.celebration,
                              color: pColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Student Upcoming \nBirthDay",
                              style: TextStyle(fontSize: 18, color: pColor),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(
                              Icons.open_in_new,
                              color: pColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildOverviewContainer(
      {required String title, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 18.0,
            color: pColor,
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
