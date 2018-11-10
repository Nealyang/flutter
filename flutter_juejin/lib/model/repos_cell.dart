import '../util/util.dart';
class ReposCell {
  String userName;
  String repoName;
  String language;
  int stars;
  int fork;
  String description;
  String time;
  String url;

  ReposCell(
      {this.userName,
      this.description,
      this.fork,
      this.language,
      this.repoName,
      this.url,
      this.time,
      this.stars});

  factory ReposCell.fromJson(Map<String, dynamic> json) {
    return ReposCell(
      description: json['description'] == ''?'No description provided':json['description'],
      userName:json['userName'],
      fork:json['fork'],
      stars:json['stars'],
      repoName:json['repoName'],
      language:json['language'],
      url:json['url'],
      time: Util.getTimeDuration(json['updatedAt'])
    );
  }
}
