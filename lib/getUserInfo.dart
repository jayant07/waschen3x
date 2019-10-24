import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetInfo {
  getUserInfo(String email) {
    return Firestore.instance
        .collection('UserInfo')
        .where('email', isEqualTo: email)
        .getDocuments();
  }
}
