
import 'package:demo_ui/form/add_enquiry_form.dart';
import 'package:demo_ui/form/add_exam_form.dart';
import 'package:demo_ui/form/add_new_batch_form.dart';
import 'package:demo_ui/src/pages/home_page.dart';
import 'package:demo_ui/src/pages/revenu_page.dart';
import 'package:demo_ui/src/pages/staff_page.dart';
import 'package:demo_ui/utils/drawer.dart';
import 'package:demo_ui/widgets/subscription_info.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPageContent();
  }
}

class MainPageContent extends StatefulWidget {
  const MainPageContent({super.key});

  @override
  _MainPageContentState createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  int _currentIndex = 0;

  // Define the pages for each navigation item here
  final List<Widget> _pages = [
    const HomePage(),
    const RevenuePage(),
    const StaffPage(),
    const ExamsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  pColor, // Dark blue color for AppBar
          title: const Row(
            children: [
              SizedBox(width: 2), // Add some spacing
              Text('TechLead',style: TextStyle(color: Colors.white),), // Replace with your app name
            ],
          ),
          actions: [
            // Profile Icon
            IconButton(
              icon: const Icon(Icons.account_circle,color: Colors.white,),
              onPressed: () {
                // Handle profile icon press here
              },
            ),
            // Notification Icon
            IconButton(
              icon: const Icon(Icons.notifications,color: Colors.white,),
              onPressed: () {
                // Handle notification icon press here
              },
            ),
            IconButton(
              icon: const Icon(Icons.subscriptions,color: Colors.white,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SubscriptionInfo()),
                );
                // Handle notification icon press here
              },
            ),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor:  pColor,
          showUnselectedLabels: true,
          fixedColor:  pColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

          },
          items:  const [
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
                Icons.settings,
                color: pColor,
              ),
              label: 'Settings',
            ),
          ],
        ),
        drawer:const MyDrawer(),
      ),
    );
  }
}

// Define your pages here (OverviewPage, StudentsPage, etc.)




class BatchesPage extends StatelessWidget {
  const BatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Batches Page")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the AddStudent page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewBatch()),
          );
        },
        icon: const Icon(Icons.group,color: Colors.white),
        // Icon for the "Add Student" button
        backgroundColor:  pColor, label: const Text('Add New Batch',style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(child: Text("Exams Page")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExam()),
          );
        },
        icon: const Icon(Icons.book,color: Colors.white),

        backgroundColor:  pColor, label: const Text('Add Exam',style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class EnquiriesPage extends StatelessWidget {
  const EnquiriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(child: Text("Enquiries Page")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the AddStudent page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEnquiry()),
          );
        },
        icon: const Icon(Icons.chat,color: Colors.white,),
        // Icon for the "Add Student" button
        backgroundColor:  pColor, label: const Text("Add Enquiry",style: TextStyle(color: Colors.white),), // Background color for the button
      ),
    );
  }
}
