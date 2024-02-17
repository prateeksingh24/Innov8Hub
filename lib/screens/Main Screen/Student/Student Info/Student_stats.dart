import 'package:demo_ui/screens/Main%20Screen/Student/Student%20Info/personal_info_page.dart';
import 'package:flutter/material.dart';

import '../../../../form/add_exam_form.dart';
import '../../../../utils/colors.dart';


class StudentStats extends StatelessWidget {
  const StudentStats({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  pColor,
      ),
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:  pColor,
            title:  const Text('Student Info',style: TextStyle(color: Colors.white,
            fontFamily: 'Mooli'),),
            actions: [
              Container(margin:  const EdgeInsets.all(12),
                child: TextButton(
                  onPressed: () {
                    // Handle save button press here
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // White background color
                  ),
                  child:  const Text(
                    'Active',
                    style: TextStyle(
                      color: Colors.white, // Dark blue text color
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
            bottom:  const TabBar(
              tabs: [
                Tab(child: Text("Batch & Fee",style:TextStyle(color: Colors.white),),),
                Tab(child: Text("Personal Info",style:TextStyle(color: Colors.white),),),
                Tab(child: Text("Exams",style:TextStyle(color: Colors.white),),),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              BatchAndFeePage(),
              const PersonalInfoPage(),
              ExamsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class BatchAndFeePage extends StatelessWidget {
   BatchAndFeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Assigned Batch"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the AddStudent page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const AddExam()),
          );
        },
        icon:  const Icon(Icons.school,color: Colors.white,), // Icon for the button
        label:  const Text("Assign In New Batch",style: TextStyle(color: Colors.white),), // Label for the button
        backgroundColor:  pColor, // Background color for the button
      ),
    );
  }
}




class ExamsPage extends StatelessWidget {
   ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Exams Page',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
