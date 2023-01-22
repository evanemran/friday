import 'dart:convert';

import 'package:friday/constants/strings.dart';
import 'package:friday/models/request_model.dart';
import 'package:friday/models/message.dart';
import 'package:friday/models/server_response.dart';
import 'package:http/http.dart' as http;

import '../styles/app_toast.dart';

class Manager {

  var headers = {
    'Content-Type': 'application/json',
  };

  Future<Message> chat(RequestModel requestModel) async {
    final uri = Uri.parse(AppStrings.chat);
    final response = await http.post(uri,
        headers: headers,
        body: json.encode(requestModel.toJson()));

    if (response.statusCode == 200) {
      print(response.toString());

      ServerResponse serverResponse = ServerResponse.fromJson(
          jsonDecode(response.body));

      return Message(serverResponse.text.isEmpty ? "I can't process this!" : serverResponse.text, 1);
    } else {
      AppToast().showToast('Failed to connect!', true);
      throw Exception('Failed to connect!');
    }
  }
}