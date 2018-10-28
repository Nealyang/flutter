import 'package:flutter/material.dart';

class Products extends StatelessWidget{

  final List<String> products;

  Products([this.products = const []]){
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context,int index){
    return new Card(
      child:new Column(
        children:<Widget>[
          new Image.asset('assets/food.jpg'),
          new Text(products[index])
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context){
    print('[Products Widget] build()');
    return ListView.builder(
      itemBuilder:_buildProductItem,
      itemCount:products.length
    );
  }
}