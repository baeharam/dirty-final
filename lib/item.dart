import 'package:classwork/detail.dart';
import 'package:classwork/global.dart';
import 'package:classwork/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item extends StatefulWidget {

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: (){},
        ),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: (){})],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('products').snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.data.documents.isNotEmpty) {
            var productList = snapshot.data.documents.map((snapshot)
              => Product.fromSnapshot(snapshot)).toList();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: productList.length,
              itemBuilder: (_,index){
                return Card(
                  child: Column(
                    children: [
                      Container(
                        width: 100.0,
                        height: 150.0,
                        child: Image.network(productList[index].image)
                      ),
                      Text(productList[index].name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(productList[index].price.toString()),
                          GestureDetector(
                            child: Text('more',style: TextStyle(color: Colors.blue),),
                            onTap: () {
                              Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) 
                                => Detail(documentID: productList[index].documentID))
                            );},
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            );
          }
          return Container();
        }
      ),
    );
  }
}