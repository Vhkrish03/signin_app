import 'package:flutter/material.dart';
import 'dart:io';


class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();
  String name = '';
  String email = '';
  String degree = '';
  String yearofpassout = '';
  String college = '';
  String contact = '';
  String department = '';
  String branch = '';
  String regno = '';
  String selecteddegree = '';
  File? profileImage01;
  File? profileImage02;
  File? resumeImage;
  File? aadhaarImage;
}
