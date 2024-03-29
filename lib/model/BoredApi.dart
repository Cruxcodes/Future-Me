class BoredApi {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  BoredApi(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  BoredApi.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['type'] = this.type;
    data['participants'] = this.participants;
    data['price'] = this.price;
    data['link'] = this.link;
    data['key'] = this.key;
    data['accessibility'] = this.accessibility;
    return data;
  }
}
