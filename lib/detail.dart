import 'package:classwork/edit.dart';
import 'package:classwork/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {

  final String documentID;

  const Detail({Key key, this.documentID}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  bool _isFetched = false;
  Product _product = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => _isFetched ? Edit(product: _product) : null
            )),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){},
          )
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance.collection('products').document(widget.documentID).get(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
          Product product = Product.fromSnapshot(snapshot.data);
          _product = product;
          _isFetched = true;
          return Column(
            children: [
              Container(
                width: 100.0,
                height: 150.0,
                child: Image.network(product.image)
              ),
              Text(
                'category: ' + product.category,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'name: ' + product.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                'price: \$ '+product.price.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(width: double.infinity, height: 2.0),
              Text(
                'information: ' + product.information,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                )
              )
            ],
          );
        }
      ),
    );
  }
}