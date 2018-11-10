import 'package:flutter/material.dart';
import '../model/repos_cell.dart';
import '../util/util.dart';
import '../routers/application.dart';
import 'dart:core';

class ReposListCell extends StatelessWidget {
  final ReposCell cellData;

  ReposListCell({Key key, this.cellData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/detail?id=${Uri.encodeComponent(cellData.url)}&title=${Uri.encodeComponent(cellData.repoName)}");
      },
          child: Container(
        padding: const EdgeInsets.only(
          left: 23.0,
          top: 30.0,
          bottom: 30.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).accentColor, width: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${cellData.userName} / ${cellData.repoName}",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 21.0),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.0,),
            Container(
              width: Util.setPercentage(0.8,context),
              child: Text(
                cellData.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.0,height: 1.3),
              ),
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Container(
                  height: 18.0,
                  width: 18.0,
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    color: Util.getLangColor(cellData.language),
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                ),
                Text(cellData.language),
                SizedBox(
                  width: 20.0,
                ),
                Icon(Icons.star,color:Colors.black26,),
                SizedBox(
                  width: 5.0,
                ),
                Text(cellData.stars.toString()),
                SizedBox(
                  width: 20.0,
                ),
                Icon(Icons.merge_type,color:Colors.black26),
                SizedBox(
                  width: 5.0,
                ),
                Text(cellData.fork.toString()),
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(cellData.time,style:TextStyle(color:Theme.of(context).accentColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
