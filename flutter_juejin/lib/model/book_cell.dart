class BookCell {
  String id;
  int sectionCount;
  int buyCount;
  String img;
  String title;
  String userName;
  double price;

  BookCell(
      {this.id,
      this.buyCount,
      this.img,
      this.price,
      this.title,
      this.sectionCount,
      this.userName});

  factory BookCell.fromJson(Map<String, dynamic> json) {
    return BookCell(
        id: json['_id'],
        buyCount: json['buyCount'],
        img: json['img'],
        title:json['title'],
        price: json['price'],
        sectionCount: json['section'].length,
        userName: json['userData']['username']);
  }
}
