
import 'package:classwork/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Global {
  static FirebaseUser currentUser;
  static FirebaseStorage storage;
  static Product currentProduct;
  static final String defaultImage = 
    'http://spnimage.edaily.co.kr/images/photo/files/NP/S/2018/10/PS18102900067.jpg';
}