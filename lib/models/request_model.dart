class RequestModel {
  String? query;
  String? key;
  String? unit;

  RequestModel({this.query, this.key, this.unit});

  RequestModel.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    key = json['key'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    data['key'] = this.key;
    data['unit'] = this.unit;
    return data;
  }
}
