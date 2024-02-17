import 'package:demo_ui/models/AddStudentModel.dart';
import 'package:demo_ui/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

// class AddStudent extends StatelessWidget {
//   const AddStudent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppProvider>(
//       builder: (context, provider, child) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: pColor,
//             title: const Text(
//               'Add Student',
//               style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
//             ),
//           ),
//           body: const AddStudentForm(),
//         );
//       },
//     );
//   }
// }

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedGender = 'Male';
  DateTime _selectedDate = DateTime.now();
  AddStudentModel registerStudentModel = AddStudentModel();
  final TextEditingController _dateController = TextEditingController();
  TextEditingController studentName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController aadharNumber = TextEditingController();
  TextEditingController caste = TextEditingController();
  TextEditingController whatsAppNo = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController schoolName = TextEditingController();
  TextEditingController rollNumber = TextEditingController();
  TextEditingController standard = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = "${_selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = "${_selectedDate.toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: pColor,
            title: const Text(
              'Add Student',
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            ),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage(
                                'assets/profile/student_profile_icon.jpg'),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Profile Info',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text('Name: John Doe'),
                              Text('Email: john@example.com'),
                              Text('Phone: +1 123-456-7890'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: studentName,
                            decoration: const InputDecoration(
                              labelText: 'Student Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Student Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: fatherName,
                            decoration: const InputDecoration(
                              labelText: 'Father Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Father Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: motherName,
                            decoration: const InputDecoration(
                              labelText: 'Mother Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Mother Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            readOnly: true,
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'Join Date',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () => _selectDate(context),
                                icon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                              border: OutlineInputBorder(),
                            ),
                            value: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                                gender.text = value;
                              });
                            },
                            items:
                                <String>['Male', 'Female'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            validator: (value) {
                              if (_selectedGender == null) {
                                return 'Please select Gender';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: aadharNumber,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Aadhar Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Aadhar Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: caste,
                            decoration: const InputDecoration(
                              labelText: 'Caste',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Caste';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: whatsAppNo,keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'WhatsApp Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter WhatsApp Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: phoneNo,keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Phone Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: address,
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Address';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: schoolName,
                            decoration: const InputDecoration(
                              labelText: 'School Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter School Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: rollNumber,keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Roll Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Roll Number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: standard,
                            decoration: const InputDecoration(
                              labelText: 'Standard',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Standard';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('object');
                provider.addStudent(
                  userId: studentName.text + _dateController.text,
                  studentName: studentName.text,
                  fatherName: fatherName.text,
                  motherName: motherName.text,
                  dateOfBirth: _dateController.text,
                  gender: gender.text,
                  aadhar: aadharNumber.text,
                  caste: caste.text,
                  whatsappNumber: whatsAppNo.text,
                  phoneNumber: phoneNo.text,
                  address: address.text,
                  schoolName: schoolName.text,
                  rollNumber: rollNumber.text,
                  standard: standard.text,
                  logo: '',
                  context: context,
                );
              }
            },
            label: const Text(
              'Add Now',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(
              Icons.upload_file,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
