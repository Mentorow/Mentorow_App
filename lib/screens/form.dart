import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mentorow/screens/base_screen.dart';
import 'package:mentorow/screens/course_screen.dart';

class AuthDialog extends StatefulWidget {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _specializationController = TextEditingController();
  TextEditingController _jobLocationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _yearOfPassoutController = TextEditingController();

  Future<void> _register(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String qualification,
    String specialization,
    String jobLocation,
    String experience,
    String yearOfPassout,
  ) async {
    var urlString = 'https://mentorow.onrender.com/api/student/create';
    var url = Uri.parse(urlString);

    var data = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'qualification': qualification,
      'specialization': specialization,
      'jobLocation': jobLocation,
      'experience': experience,
      'yearOfPassout': yearOfPassout,
    };

    try {
      var response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        _showSuccessMessage('Successfully Saved');
        // Navigate to the next page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CourseScreen(), // Replace 'NextPage' with your actual next page
          ),
        );
      } else {
        _showErrorMessage('Registration failed');
      }
    } catch (e) {
      _showErrorMessage('Error occurred');
    }
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration:
                      InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _qualificationController,
                  decoration:
                      InputDecoration(labelText: 'Qualification'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your qualification';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _specializationController,
                  decoration:
                      InputDecoration(labelText: 'Specialization'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your specialization';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _jobLocationController,
                  decoration:
                      InputDecoration(labelText: 'Job Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your job location';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _experienceController,
                  decoration:
                      InputDecoration(labelText: 'Experience'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your experience';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _yearOfPassoutController,
                  decoration:
                      InputDecoration(labelText: 'Year of Passout'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your year of passout';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _register(
                        _firstNameController.text,
                        _lastNameController.text,
                        _emailController.text,
                        _phoneNumberController.text,
                        _qualificationController.text,
                        _specializationController.text,
                        _jobLocationController.text,
                        _experienceController.text,
                        _yearOfPassoutController.text,
                      );
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

