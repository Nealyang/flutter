import '../util/util.dart';

class PinsCell {
  Map<String, dynamic> user;
  String objectId;
  String uid;
  String content;
  List<String> pictures;
  int commentCount;
  int likedCount;
  String createdAt;
  Map<String, dynamic> topic;
  String url;
  String urlTitle;
  String urlPic;

  PinsCell(
      {this.commentCount,
      this.content,
      this.createdAt,
      this.likedCount,
      this.objectId,
      this.pictures,
      this.topic,
      this.uid,
      this.user,this.url,this.urlPic,this.urlTitle});

  factory PinsCell.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> user = new Map();
    user['avatarLarge'] = json['user']['avatarLarge'];
    user['objectId'] = json['user']['objectId'];
    user['company'] = json['user']['company'];
    user['jobTitle'] = json['user']['jobTitle'];
    user['role'] = json['user']['role'];
    user['userName'] = json['user']['username'];
    user['currentUserFollowed'] = json['user']['currentUserFollowed'];

    Map<String, dynamic> topic = new Map();
    // 有的沸点没有topic
    if (json['topic'] != null) {
      topic['objectId'] = json['topic']['objectId'];
      topic['title'] = json['topic']['title'];
    }

    List<String> pics = new List();
    // pics = json['pictures'];_TypeError (type 'List<dynamic>' is not a subtype of type 'List<String>')
    json['pictures'].forEach((ele) {
      pics.add(ele);
    });

    return PinsCell(
        commentCount: json['commentCount'],
        content: json['content'],
        createdAt: Util.getTimeDuration(json['createdAt']),
        likedCount: json['likedCount'],
        objectId: json['objectId'],
        pictures: pics,
        topic: topic,
        uid: json['uid'],
        url: json['url'],
        urlPic: json['urlPic'],
        urlTitle: json['urlTitle'],
        user: user);
  }
}
