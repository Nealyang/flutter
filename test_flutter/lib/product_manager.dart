import 'package:flutter/material.dart';

import './product_control.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = 'Sweets Tester'}) {
    print('[ProductManager Widget] Construcotr ');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    print('[ProductManager State] initState()');
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');

    return new Column(
      children:<Widget>[
        new Container(
          margin:EdgeInsets.all(10.0),
          child:ProductControl(_addProduct),
        ),
        new Expanded(
          child:Products(_products)
        )
      ]
    );
  }
}
