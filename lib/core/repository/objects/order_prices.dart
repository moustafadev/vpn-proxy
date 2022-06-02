class Prices {
  int? rub;
  Prices? prices;

  Prices({this.rub, this.prices});

  Prices.fromJson(Map<String, dynamic> json) {
    rub = json['rub'];
    prices =
        json['prices'] != null ? new Prices.fromJson(json['prices']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rub'] = this.rub;
    if (this.prices != null) {
      data['prices'] = this.prices!.toJson();
    }
    return data;
  }
}
