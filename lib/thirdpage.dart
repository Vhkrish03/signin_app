import 'package:companyweb/main.dart';
import 'package:companyweb/secondpage.dart';
import 'package:companyweb/userdata.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(home: thirdpage(), debugShowCheckedModeBanner: false));
}

class thirdpage extends StatefulWidget {
  const thirdpage({super.key});

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  // for camera access and upload file
  File? _image03;
  File? _image04;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _image03 = UserData().resumeImage;
    _image04 = UserData().aadhaarImage;
  }

  Future<void> _pickImage03(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image03 = File(pickedFile.path);
      });
      UserData().resumeImage = File(pickedFile.path); //  Save to UserData
    } else {
      print('No image selected.');
    }
  }

  Future<void> _pickImage04(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image04 = File(pickedFile.path);
      });
      UserData().aadhaarImage = File(pickedFile.path); //  Save to UserData
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Image.asset("assets/recuirementlogo.png",  height: 160, width: 160,)]),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Candidate Resume',
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
                          'Step 3/3',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF3385BF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 05),
                Row(
                  children: [
                    Text(
                      'Please upload a clear copy of resume with visible photo',
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pickImage03(ImageSource.gallery),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9ECEC),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _image03 != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _image03!,
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
                                      "Upload User Resume",
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
                      'Candidate Aadhaar Card',
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
                      'Please upload a clear copy of aadhaar card with visible photo',
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pickImage04(ImageSource.gallery),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9ECEC),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _image04 != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _image04!,
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
                                      "Upload your aadhaar card",
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
                                  builder: (context) => SecondPage(),
                                ),
                              );
                            },
                            child: Text("Previous"),
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
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      height: 280,
                                      width: 320,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              "assets/tickicon.png",
                                              width: 150,
                                            ),
                                            Text(
                                              "Your Registration Successfully Completed!",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            SizedBox(height: 25),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK"),
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                  horizontal: 10.0,
                                                ),
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(08),
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
                            },
                            child: Text('Submit'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 35,
                              ),
                              backgroundColor: Colors.green,
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
    );
  }
}


