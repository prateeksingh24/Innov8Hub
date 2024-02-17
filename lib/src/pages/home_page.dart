import 'package:demo_ui/form/add_enquiry_form.dart';
import 'package:demo_ui/form/add_exam_form.dart';
import 'package:demo_ui/form/add_new_batch_form.dart';
import 'package:demo_ui/models/ExamModel.dart';
import 'package:demo_ui/models/batch_model.dart';
import 'package:demo_ui/provider/app_provider.dart';
import 'package:demo_ui/src/pages/revenu_page.dart';
import 'package:demo_ui/src/pages/staff_page.dart';
import 'package:demo_ui/utils/drawer.dart';
import 'package:demo_ui/widgets/profile_page.dart';
import 'package:demo_ui/widgets/subscription_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/Main Screen/Overview/overview_main_page.dart';
import '../../utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageContent();
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int _currentIndex = 0;

  // Define the pages for each navigation item here
  final List<Widget> _pages = [
    const OverviewPage(),
    const RevenuePage(),
    const StaffPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pColor, // Dark blue color for AppBar
          title: Row(
            children: [
              Image.asset('assets/logo.png', width: 40, height: 40),
              const SizedBox(width: 10), // Add some spacing
              const Text(
                'Tutio',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Mooli',
                  fontWeight: FontWeight.bold,
                ),
              ), // Replace with your app name
            ],
          ),
          actions: [
            // Profile Icon
            // Notification Icon
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle notification icon press here
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/subscription_icon.png',
                color: Colors.white,
                width: 27,
                height: 27,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubscriptionInfo()),
                );
                // Handle notification icon press here
              },
            ),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: pColor,
          showUnselectedLabels: true,
          fixedColor: pColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, color: pColor),
              label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined, color: pColor),
              label: 'Revenue',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, color: pColor),
              label: 'Staff',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: pColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}

// Define your pages here (OverviewPage, StudentsPage, etc.)

//////

Widget buildBatchCard({
  required BuildContext context,
  required BatchModel batch,
}) {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/3135/3135810.png',
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              batch.batchName,
              style: const TextStyle(
                fontSize: 18.0,
                color: pColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.info,
              color: pColor,
            ),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const StudentStats(),
              //   ),
              // );
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildExamCard({
  required BuildContext context,

}) {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/3135/3135810.png',
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              'ABC',
              style: const TextStyle(
                fontSize: 18.0,
                color: pColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.info,
              color: pColor,
            ),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const StudentStats(),
              //   ),
              // );
            },
          ),
        ],
      ),
    ),
  );
}
///////

class BatchesPage extends StatelessWidget {
  @override
  final TextEditingController _searchController = TextEditingController();

  BatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search  Batch Name....',
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.person_search,
                              size: 30,
                              color: pColor,
                            ),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder<BatchModel?>(
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
                        } else {
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: provider.batches.length,
                            itemBuilder: (context, index) {
                              final batch = provider.batches[index];
                              return buildBatchCard(
                                context: context,
                                batch: batch,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewBatch()),
                );
              },
              icon: const Icon(Icons.group, color: Colors.white),
              backgroundColor: pColor,
              label: const Text('Add New Batch',
                  style: TextStyle(
                      color: Colors.white)), // Background color for the button
            ),
          );
        },
      ),
    );
  }
}

class ExamsPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // Add padding around the search bar
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      // Use a Material design search bar
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Exam Topic....',
                          // Add a clear button to the search bar
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.person_search,
                              size: 30,
                              color: pColor,
                            ),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          // Add a search icon or button to the search bar

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder<ExamModel?>(
                      future: provider.getExam(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData &&
                            provider.examsMap.isEmpty) {
                          return const Center(
                            child: Text(
                              'No data available.',
                              style: TextStyle(color: pColor),
                            ),
                          );
                        } else {
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: provider.examsMap.length,
                            itemBuilder: (context, index) {
                              // final map = provider.examsMap[index];

                              return buildExamCard(
                                context: context,

                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          );

                          // return ListView.separated(
                          //   shrinkWrap: true,
                          //   itemCount: provider.examsMap.length,
                          //   itemBuilder: (context, index) {
                          //     final map = provider.examsMap[index];
                          //     return buildExamCard(
                          //       context: context,
                          //       map: map,
                          //     );
                          //   },
                          //   separatorBuilder: (context, index) =>
                          //       const SizedBox(height: 10),
                          // );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddExam()),
                );
              },
              icon: const Icon(Icons.book, color: Colors.white),

              backgroundColor: pColor,
              label: const Text('Add Exam',
                  style: TextStyle(
                      color: Colors.white)), // Background color for the button
            ),
          );
        },
      ),
    );
  }
}

class EnquiriesPage extends StatelessWidget {
  @override
  final TextEditingController _searchController = TextEditingController();

  EnquiriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // Add padding around the search bar
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // Use a Material design search bar
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Student Name....',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.person_search,
                    size: 30,
                    color: pColor,
                  ),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
                // Add a search icon or button to the search bar

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the AddStudent page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEnquiry()),
          );
        },
        icon: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
        // Icon for the "Add Student" button
        backgroundColor: pColor,
        label: const Text(
          "Add Enquiry",
          style: TextStyle(color: Colors.white),
        ), // Background color for the button
      ),
    );
  }
}
