import 'package:companyweb/main.dart';
import 'package:companyweb/thirdpage.dart';
import 'package:companyweb/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SecondPage()));
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // for textFormField and validate
  final _formKey =
      GlobalKey<FormState>(); // To manage form state and used to validate form
  final branchController = TextEditingController();
  final regnoController = TextEditingController();

  // for camera access and upload file
  File? _image01;
  File? _image02;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage01(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image01 = File(pickedFile.path);
      });
      UserData().profileImage01 = File(pickedFile.path); //  Save to UserData
    } else {
      print('No image selected.');
    }
  }

  Future<void> _pickImage02(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image02 = File(pickedFile.path);
      });
      UserData().profileImage02 = File(pickedFile.path); //  Save to UserData
    } else {
      print('No image selected.');
    }
  }

  @override
  void initState() {
    super.initState();
    // for text store in userdata file
    branchController.text = UserData().branch;
    regnoController.text = UserData().regno;
    // for image store in userdata file
    _image01 = UserData().profileImage01;
    _image02 = UserData().profileImage02;
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
                            "Step 2/3",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF3385BF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: branchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Batch',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
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
                        return 'Batch is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: regnoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Reg No',
                      labelStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(),
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
                        return 'Registration no is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'Candidate Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF2A72A5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 05),
                  Row(
                    children: [
                      Text(
                        'Please Upload a clear copy of profile with visible photo',
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickImage01(ImageSource.gallery),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9ECEC),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _image01 != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _image01!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cloud_upload,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Upload User Photo",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'Candidate Id Image',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF2A72A5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 05),
                  Row(
                    children: [
                      Text(
                        'Please Upload a clear copy of Id with visible photo',
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickImage02(ImageSource.gallery),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9ECEC),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _image02 != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _image02!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cloud_upload,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Upload ID Card",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => firstPage(),
                                  ),
                                );
                              },
                              child: Text('Previous'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 25,
                                ),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  UserData().branch = branchController.text;
                                  UserData().regno = regnoController.text;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => thirdpage(),
                                    ),
                                  );
                                }
                              },
                              child: Text('Next'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 35,
                                ),
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
