class Order {
  int? defaultLimit;
  List<Limits>? limits;

  Order({this.defaultLimit, this.limits});

  Order.fromJson(Map<String, dynamic> json) {
    defaultLimit = json['default_limit'];
    if (json['limits'] != null) {
      limits = <Limits>[];
      json['limits'].forEach((v) {
        limits!.add(new Limits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['default_limit'] = this.defaultLimit;
    if (this.limits != null) {
      data['limits'] = this.limits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Limits {
  int? limit;
  Params? params;

  Limits({this.limit, this.params});

  Limits.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    if (this.params != null) {
      data['params'] = this.params!.toJson();
    }
    return data;
  }
}

class Params {
  String? countryId;
  int? ipType;
  int? ipVersion;

  Params({this.countryId, this.ipType, this.ipVersion});

  Params.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    ipType = json['ip_type'];
    ipVersion = json['ip_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['ip_type'] = this.ipType;
    data['ip_version'] = this.ipVersion;
    return data;
  }
}
