class RequestModel {
  String? model = "text-davinci-002";
  String? prompt;
  int? temperature = 0;
  int? maxTokens = 4000;

  RequestModel(this.prompt);

  RequestModel.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    prompt = json['prompt'];
    temperature = json['temperature'];
    maxTokens = json['max_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['prompt'] = this.prompt;
    data['temperature'] = this.temperature;
    data['max_tokens'] = this.maxTokens;
    return data;
  }
}
