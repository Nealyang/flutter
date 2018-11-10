class BookNav {
  String name;
  String id;
  String alias;

  BookNav({this.alias, this.id, this.name});

  factory BookNav.fromJson(Map<String, dynamic> json) {
    return BookNav(alias: json['alias'], name: json['name'], id: json['id']);
  }
}
