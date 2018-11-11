class ActivityNav{
  String cityName;
  String cityAlias;

  ActivityNav({
    this.cityAlias,
    this.cityName
  });

  factory ActivityNav.fromJson(Map<String,dynamic> json){
    return ActivityNav(cityAlias: json['cityAlias'],cityName: json['cityName']);
  }
}