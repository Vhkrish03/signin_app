import 'package:companyweb/secondpage.dart';
import 'package:companyweb/userdata.dart'; // import the singleton
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(webapp());
}

class webapp extends StatelessWidget {
  const webapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: firstPage());
  }
}

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  List<String> degrees = [];
  String? selectedDegree;
  String? SelectedGender;

  final _formKey =
      GlobalKey<FormState>(); // To manage form state and used to validate form
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final yearOfPassOutController = TextEditingController();
  final collegeNameController = TextEditingController();
  final contactNoController = TextEditingController();
  final departmentController = TextEditingController();
  final degreeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDegrees();
    nameController.text = UserData().name;
    emailController.text = UserData().email;
    yearOfPassOutController.text = UserData().yearofpassout;
    collegeNameController.text = UserData().college;
    contactNoController.text = UserData().contact;
    departmentController.text = UserData().department;
  }

  Future<void> fetchDegrees() async {
    final url =
        "https://stargls.in/college_master_api_php/index.php/get_m_degree";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData["data"];

      setState(() {
        degrees = data.map((item) => item["degree"].toString()).toList();
        selectedDegree = degrees.isNotEmpty ? degrees[0] : null;
        print(degrees);
      });
    } else {
      print("Failed to load degrees");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Image.asset("assets/recuirementlogo.png", height: 160, width: 160,)]),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Candidate Details",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF2A72A5),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Step 1/3",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF3385BF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense:
                          true, // tells Flutter to make the field less tall (more compact vertically).
                      labelText: 'Candidate Name',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Candidate Email',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'email is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedDegree,
                    items: degrees.map((degree) {
                      return DropdownMenuItem<String>(
                        value: degree,
                        child: Text(degree),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDegree = value;
                        print(selectedDegree);
                      });
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Degree',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Degree is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: yearOfPassOutController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Year of Passout',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Year of passout is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: collegeNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Candidate College',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'College Name is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: contactNoController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Candidate Contact',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Contact no is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: departmentController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Department',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(color: Colors.black26, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(05),
                        borderSide: BorderSide(
                          color: CupertinoColors.activeBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Department is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Gender", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'male',
                        activeColor: Colors.blue,
                        groupValue: SelectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            SelectedGender = value;
                          });
                        },
                      ),
                      Text("Male"),
                      SizedBox(width: 10),
                      Radio<String>(
                        value: 'Female',
                        activeColor: Colors.blue,
                        groupValue: SelectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            SelectedGender = value;
                          });
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        UserData().name = nameController.text;
                        UserData().email = emailController.text;
                        UserData().yearofpassout = yearOfPassOutController.text;
                        UserData().college = collegeNameController.text;
                        UserData().contact = contactNoController.text;
                        UserData().department = departmentController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      }
                    },
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 90,
                      ),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
