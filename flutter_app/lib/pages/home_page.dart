import 'package:flutter/material.dart';

import './second_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar:new AppBar(
        title:new Text('flutter app'),
        backgroundColor:Colors.blue[400]
      ),
      drawer: new Drawer(
        child: new ListView(
          children:<Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Nealyang'),
              accountEmail: new Text('isNealyang@outlook.com'),
              currentAccountPicture: new GestureDetector(//用户头像
                onTap: ()=>print('点击头像'),
                child: new CircleAvatar(
                  backgroundImage:new NetworkImage('https://img.alicdn.com/tfs/TB1he8KgxTpK1RjSZFKXXa2wXXa-1629-1080.jpg')
                ),
              ),
              otherAccountsPictures:<Widget>[
                new GestureDetector(
                  onTap:()=>print('点击粉丝头像'),
                  child:new CircleAvatar(
                    backgroundImage:new NetworkImage('https://img.alicdn.com/tfs/TB1spY7fW6qK1RjSZFmXXX0PFXa-500-504.png')
                  )
                ),
                new GestureDetector(
                  onTap:()=>print('点击粉丝头像'),
                  child:new CircleAvatar(
                    backgroundImage:new NetworkImage('https://img.alicdn.com/tfs/TB148sWfMHqK1RjSZFgXXa7JXXa-536-482.png')
                  )
                ),
                new GestureDetector(
                  onTap:()=>print('点击粉丝头像'),
                  child:new CircleAvatar(
                    backgroundImage:new NetworkImage('https://img.alicdn.com/tfs/TB1XD.ZuYwrBKNjSZPcXXXpapXa-255-251.png')
                  )
                ),
              ],
              decoration: new BoxDecoration(
                image:new DecorationImage(
                  fit:BoxFit.cover,
                  image:new ExactAssetImage('images/bg.JPG')
                )
              ),
            ),
            new ListTile(
              title:new Text('second page'),
              trailing:new Icon(Icons.arrow_right),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SecondPage(title:'Second Page')));
              },
            ),
            new Divider(),
            new ListTile(
              title:new Text('Close'),
              trailing:new Icon(Icons.cancel),
              onTap:()=>Navigator.of(context).pop()
            )
          ]
        ),
      ),
      body: new Center(
        child:new Text('Home Page',style:new TextStyle(fontSize:35.0))
      ),
    );
  }
}