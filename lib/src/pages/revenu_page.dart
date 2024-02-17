
import 'package:demo_ui/screens/Revenue%20Screen/Overview/overview_revenue_page.dart';
import 'package:demo_ui/utils/drawer.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';



class RevenuePage extends StatelessWidget {
  const RevenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RevenuePageContent();
  }
}

class RevenuePageContent extends StatefulWidget {
  const RevenuePageContent({super.key});

  @override
  _RevenuePageContentState createState() => _RevenuePageContentState();
}

class _RevenuePageContentState extends State<RevenuePageContent> {


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Revenue(),
      drawer: MyDrawer()
    );
  }
}

// Define your pages here (OverviewPage, StudentsPage, etc.)



class DueFee extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  DueFee({super.key});
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
                  icon:  const Icon(Icons.person_search,size: 30,color: pColor,),
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

class CollectedFee extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  CollectedFee({super.key});
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

class Expenses extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Expenses({super.key});
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
