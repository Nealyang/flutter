import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return  new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.orangeAccent,
            title: new TabBar(
              tabs: [
                new Tab(
                  child:new Column(
                    children:<Widget>[
                      new Icon(Icons.directions_car),
                      new Text('Car')
                    ]
                  )
                ),
                new Tab(
                  child:new Column(
                    children:<Widget>[
                      new Icon(Icons.directions_transit),
                      new Text('transit')
                    ]
                  )
                ),
                new Tab(
                  child:new Column(
                    children:<Widget>[
                      new Icon(Icons.directions_bike),
                      new Text('bike')
                    ]
                  )
                ),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: new TabBarView(
            children: [
              new Icon(Icons.directions_car),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
            ],
          ),
        ),
      )
    ;
  }
}