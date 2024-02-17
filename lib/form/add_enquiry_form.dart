import 'package:flutter/material.dart';

import '../utils/colors.dart';



class AddEnquiry extends StatelessWidget {
  const AddEnquiry({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor:  pColor, // Dark blue color for AppBar
        title: const Text('Add Enquiry',style: TextStyle(color: Colors.white,fontFamily: 'Poppins'),),
        actions: [

          Container(
            margin: const EdgeInsets.all(11),
            child: TextButton(
              onPressed: () {
                // Handle save button press here
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // White background color
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: pColor, // Dark blue text color
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: const AddEnquiryForm(),
    );
  }
}

class AddEnquiryForm extends StatefulWidget {
  const AddEnquiryForm({super.key});

  @override
  _AddEnquiryFormState createState() => _AddEnquiryFormState();
}

class _AddEnquiryFormState extends State<AddEnquiryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime _selectedEnquiryDate = DateTime.now();
  DateTime _selectedFollowUpDate = DateTime.now();

  TextEditingController _enquiryDateController = TextEditingController();
  TextEditingController _followUpDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: controller == _enquiryDateController
          ? _selectedEnquiryDate
          : _selectedFollowUpDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (controller == _enquiryDateController) {
          _selectedEnquiryDate = pickedDate;
          _enquiryDateController.text = "${_selectedEnquiryDate.toLocal()}".split(' ')[0];
        } else {
          _selectedFollowUpDate = pickedDate;
          _followUpDateController.text = "${_selectedFollowUpDate.toLocal()}".split(' ')[0];
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _enquiryDateController.text = "${_selectedEnquiryDate.toLocal()}".split(' ')[0];
    _followUpDateController.text = "${_selectedFollowUpDate.toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    _enquiryDateController.dispose();
    _followUpDateController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Row(
                  children: <Widget>[
                    // Image of the profile on the left side
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/profile/student_profile_icon.jpg'),
                      ),
                    ),
                    // Text on the right side above the profile info
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
                          // Add your profile information here
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
                elevation: 5, // Add elevation for the 3D effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const Text('Enquiry Details',style: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontSize: 20,fontWeight: FontWeight.w400),),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Student Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Student Name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Student / Parent Number'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Phone Number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email Address'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Mother Name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: 'Date Of Birth'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Email Address';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: 'Address'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Main Subject For Enquiry'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Caste';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _enquiryDateController,
                        decoration: InputDecoration(
                          labelText: 'Enquiry Date',
                          suffixIcon: IconButton(
                            onPressed: () => _selectDate(context, _enquiryDateController),
                            icon: const Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _followUpDateController,
                        decoration: InputDecoration(
                          labelText: 'Follow Up Date',
                          suffixIcon: IconButton(
                            onPressed: () => _selectDate(context, _followUpDateController),
                            icon: const Icon(Icons.calendar_today,),
                          ),
                        ),
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
    );
  }
}
