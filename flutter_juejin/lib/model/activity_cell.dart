import '../util/util.dart';
class ActivityCell{
  String pic;
  String detailUrl;
  String title;
  String city;
  String time;

  ActivityCell({
    this.city,
    this.detailUrl,
    this.pic,
    this.time,
    this.title
  });

  factory ActivityCell.formJson(Map<String,dynamic> json){
    return ActivityCell(
      city: json['city'],
      detailUrl: json['eventUrl'],
      title:json['title'],
      pic:json['screenshot'],
      time: Util.getTimeDate(json['startTime'])
    );
  }
}