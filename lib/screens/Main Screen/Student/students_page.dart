import 'package:demo_ui/models/students_model.dart';
import 'package:demo_ui/provider/app_provider.dart';
import 'package:demo_ui/screens/Main%20Screen/Student/Student%20Info/Student_stats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../form/add_student_form.dart';
import '../../../utils/colors.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () {
                provider.studentsCalled= false;
                return provider.getStudents();
              },
              color: pColor,
              backgroundColor: Colors.black,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search Student Name....',
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
                      child: FutureBuilder<Student?>(
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
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: provider.students.length,
                              itemBuilder: (context, index) {
                                final student = provider.students[index];
                                return buildStudentCard(
                                  context: context,
                                  student: student,
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 10),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddStudent()),
                );
              },
              icon: const Icon(Icons.school, color: Colors.white),
              label: const Text("Add Student",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: pColor,
            ),
          );
        },
      ),
    );
  }

  Widget buildStudentCard({
    required BuildContext context,
    required Student student,
  }) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(),
        child : Row(
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
              child : Text(
                student.studentName,
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StudentStats(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Student class (you can create your own)
class StudentOld {
  final String name;
  final String imagePath;

  StudentOld({required this.name, required this.imagePath});
}
