import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import '../utils/colors.dart';

class AddNewBatch extends StatefulWidget {
  const AddNewBatch({super.key});

  @override
  _AddNewBatchState createState() => _AddNewBatchState();
}

class _AddNewBatchState extends State<AddNewBatch> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedFeeType = 'Monthly';
  final TextEditingController batchName = TextEditingController();
  final TextEditingController feeAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: pColor,
            title: const Text(
              'Add New Batch',
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(11),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      provider
                          .addBatch(
                        userId: 'userId',
                        batchName: batchName.text,
                        feeType: _selectedFeeType,
                        feeAmount: feeAmount.text,
                        logo: '',
                        context: context,
                      )
                          .then((value) {
                        provider.batchesCalled = false;
                        provider
                            .getBatches()
                            .then((value) => Navigator.pop(context));
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: pColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Form(
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
                            backgroundImage: AssetImage(
                                'assets/profile/student_profile_icon.jpg'),
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
                  // (Student Information)
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
                            controller: batchName,
                            decoration:
                                const InputDecoration(labelText: 'Batch Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Batch Name';
                              }
                              return null;
                            },
                          ),
                          DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Fee Type'),
                            value: _selectedFeeType,
                            onChanged: (value) {
                              setState(() {
                                _selectedFeeType = value!;
                              });
                            },
                            items: <String>['Monthly', 'Course Basic']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            validator: (value) {
                              if (_selectedFeeType == null) {
                                return 'Please select Fee Type';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: feeAmount,
                            decoration:
                                const InputDecoration(labelText: 'Fee Amount'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Fee Amount';
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
        );
      },
    );
  }
}
