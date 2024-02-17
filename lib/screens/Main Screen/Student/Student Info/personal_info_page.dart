
import 'package:flutter/material.dart';


class StudentPersonalInfo extends StatelessWidget {
  const StudentPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const PersonalInfoPage();
  }
}


class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic Info
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Basic Info',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      Icon(Icons.info),
                    ],

                  ),

                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      InfoRow(title: 'Father Name', value: 'Umesh Kumar'),
                      InfoRow(title: 'Mother Name', value: 'Sita Devi'),
                      InfoRow(title: 'Gender', value: 'Male'),
                      InfoRow(title: 'Birth Date', value: '01/01/1990'),
                      InfoRow(title: 'Caste Name', value: 'General'),
                      InfoRow(title: 'Aadhar Number', value: '1234 5678 9012'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Contact Info
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Contact Info',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      Icon(Icons.phone_android),
                    ],
                    
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      InfoRow(title: 'WhatsApp', value: '+1234567890'),
                      InfoRow(title: 'Phone Number', value: '+9876543210'),
                      InfoRow(title: 'Address', value: '123 Main St, City, Country'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Academic Info
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Academic Info',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    Icon(Icons.school),
                  ],

                ),
                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      InfoRow(title: 'School Name', value: 'XYZ High School'),
                      InfoRow(title: 'Roll Number', value: '12345'),
                      InfoRow(title: 'Standard', value: 'Grade 10'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}

