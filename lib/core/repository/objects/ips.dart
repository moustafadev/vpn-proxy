class Ips {
  int? id;
  String? ip;
  String? city;

  Ips({this.id, this.ip, this.city});

  Ips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ip = json['ip'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['ip'] = ip;
    data['city'] = city;
    return data;
  }
}
