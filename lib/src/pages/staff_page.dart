
import 'package:demo_ui/form/add_teacher_form.dart';
import 'package:demo_ui/screens/Staff/overview_staff/overview_staff_page.dart';
import 'package:demo_ui/utils/drawer.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const StaffPageContent();
  }
}

class StaffPageContent extends StatefulWidget {
  const StaffPageContent({super.key});

  @override
  _StaffPageContentState createState() => _StaffPageContentState();
}

class _StaffPageContentState extends State<StaffPageContent> {
  int _currentIndex = 0;

  // Define the pages for each navigation item here


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OverviewStaffPage(),

      drawer: MyDrawer()
    );
  }
}

// Define your pages here (OverviewPage, StudentsPage, etc.)



class StaffMenu extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  StaffMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // Add padding around the search bar
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // Use a Material design search bar
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Staff Name....',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: const Icon(Icons.person_search,size: 30,color: pColor,),
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
            MaterialPageRoute(builder: (context) => const AddTeacher()),
          );
        },
        icon: const Icon(Icons.group,color: Colors.white),
        // Icon for the "Add Student" button
        backgroundColor:  pColor, label: const Text('Add New Teacher',style: TextStyle(color: Colors.white)), // Background color for the button
      ),
    );
  }
}


class Attendence extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Attendence({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  icon: const Icon(Icons.person_search,size: 30,color: pColor,),
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
    );
  }
}

class Salary extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Salary({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                hintText: 'Search Staff Name....',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: const Icon(Icons.person_search,size: 30,color: pColor,),
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

    );
  }
}
