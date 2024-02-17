import 'package:demo_ui/provider/app_provider.dart';
import 'package:demo_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExam extends StatefulWidget {
  const AddExam({super.key});

  @override
  _AddExamState createState() => _AddExamState();
}

class _AddExamState extends State<AddExam> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedBatch = 'Batch A';
  String _selectedFeeType = 'Monthly';
  DateTime _selectedDate = DateTime.now(); // Initial value for Exam Date
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController examTopic = TextEditingController();
  final TextEditingController exMaxMarks = TextEditingController();

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
        List<String> batches =
            provider.batches.map((batch) => batch.batchName).toList();
        _selectedBatch = batches.first;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: pColor,
            title: const Text(
              'Add Exam',
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(11),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      provider
                          .addExam(
                        userId: 'userId',
                        batchId: _selectedBatch,
                        examTopic: examTopic.text,
                        exMaxMarks: exMaxMarks.text,
                        examDate: _dateController.text,
                        context: context,
                      ).then((value) {
                            provider.examCalled = false;
                        provider.getExam().then((value) {
                          Navigator.pop(context);
                        });
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
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                                labelText: 'Select Batch'),
                            value: _selectedBatch,
                            onChanged: (value) {
                              setState(() {
                                _selectedBatch = value!;
                              });
                            },
                            items: batches.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            validator: (value) {
                              if (_selectedBatch == null) {
                                return 'Please select Batch';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: examTopic,
                            decoration:
                                const InputDecoration(labelText: 'Exam Topic'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Exam Topic';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: exMaxMarks,
                            decoration: const InputDecoration(
                                labelText: 'Exam Max Marks'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Max Marks';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            readOnly: true,
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'Exam Date',
                              suffixIcon: IconButton(
                                onPressed: () => _selectDate(context),
                                icon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
