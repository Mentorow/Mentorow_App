// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mentorow/constants/borders.dart';
import 'package:mentorow/constants/color.dart';
import 'package:mentorow/screens/base_screen.dart';


import 'package:shared_preferences/shared_preferences.dart';


class AuthLoginState extends StatefulWidget {
  const AuthLoginState({Key? key}) : super(key: key);

  @override
  State<AuthLoginState> createState() => _AuthLoginStateState();
}

class _AuthLoginStateState extends State<AuthLoginState> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  


  Future<void> _register(String name, String contact) async {
    var urlString =
        'https://mentorow.onrender.com/api/userLogin/adduserDetails';
    var url = Uri.parse(urlString);

    var data = {'name': name, 'contact': contact};

    try {
      var response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );

      if (response.statusCode == 200) {
        // Save user info to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('name', name);
        prefs.setString('contact', contact);

        _showSuccessMessage('Registration successful');
      } else {
        _showErrorMessage('Registration failed');
      }
    } catch (e) {
      _showErrorMessage('Error occurred');
    }
  }

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? contact = prefs.getString('contact');

    if (name != null && contact != null) {
      // Set the retrieved values to the text controllers
      _nameController.text = name;
      _contactController.text = contact;
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 140, 20, 0),
                child: Image.asset('assets/icons/MentorowLogo.png'),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Form(
                    key: _formkey,
                    child: Column(children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: kBackgroundColor,
                          border: borders,
                          focusedBorder: borders,
                          enabledBorder: borders,
                          hintText: 'Name',
                          labelText: 'Enter your Name',
                          prefixIcon: Icon(Icons.person_2_rounded),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      IntlPhoneField(
                        initialCountryCode: 'IN',
                        
                       
                        keyboardType: TextInputType.phone,
                        dropdownIcon: const Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: kBackgroundColor,
                          border: borders,
                          focusedBorder: borders,
                          enabledBorder: borders,
                          hintText: 'Phone Number',
                        ),
                        controller: _contactController,
                        // onChanged: (phone) {
                        //   _contactController.text = phone.completeNumber;
                        // },
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return "please enter your phone number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          
                          if (_nameController.text.isEmpty ||
                              _contactController.text.isEmpty) {
                            _showErrorMessage(
                                'Please enter your name and contact');
                             
                          } else {
                             
                            if (_formkey.currentState!.validate()) {
                              await _register(
                                _nameController.text,
                                _contactController.text,
                              );
                               if(mounted) {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>BaseScreen(),),);
                               }
                            }
                          
                          }
                        },
                        style: TextButton.styleFrom(
                          elevation: 8,
                          backgroundColor: const Color(0xFF9A7BFF),
                          minimumSize: const Size(double.infinity, 50),
                          shadowColor: const Color(0xFF9A7BFF),
                        ),
                        child: const Text(
                          'Explore',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF030303)),
                        ),
                      ),
                    ])),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
