import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String creator;
  DateTime createdTime;
  DateTime modifedTime;
  String image;
  String name;
  String category;
  String information;
  String documentID;
  int price;

  Product();

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    image = snapshot.data['image'];
    name = snapshot.data['name'];
    price = snapshot.data['price'];
    category = snapshot.data['category'];
    information = snapshot.data['information'];
    documentID = snapshot.documentID;
    creator = snapshot.data['creator'];
    createdTime = snapshot.data['created'];
    modifedTime = snapshot.data['modified'];
  }
}