class ServerResponse {
  String query = "";
  String text = "";



  ServerResponse.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    data['text'] = this.text;
    return data;
  }

}