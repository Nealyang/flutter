import 'package:flutter/material.dart';
import '../model/activity_cell.dart';
import '../util/util.dart';
import './icon_with_text.dart';
import '../routers/application.dart';

class ActivityListCell extends StatelessWidget {
  final ActivityCell cellData;
  ActivityListCell({Key key, this.cellData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context,
            "/web?url=${Uri.encodeComponent(cellData.detailUrl)}&title=${Uri.encodeComponent(cellData.title)}");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).accentColor,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              cellData.pic,
              width: Util.setPercentage(1.0, context),
              height: 245,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cellData.title,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    IconWidthText(
                      color: Colors.black45,
                      icon: Icons.calendar_today,
                      text: cellData.time,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconWidthText(
                          color: Colors.black45,
                          icon: Icons.location_on,
                          text: cellData.city,
                        ),
                        Container(
                          width: 120.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              '报名参加',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
