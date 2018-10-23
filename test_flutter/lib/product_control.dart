import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{

  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context){
    return new RaisedButton(
      color:Theme.of(context).primaryColor,
      onPressed:(){
        addProduct('Sweets');
      },
      child:new Text('Add Product')
    );
  }
}