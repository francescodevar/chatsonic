import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatsonic/models/chat_model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class ApiService {
  static Future<List<ChatModel>> sendMessage({required String message}) async {
    try {
      var response = await http.post(
        Uri.parse(API_url),
        headers: API_headers,
        body: jsonEncode(
          {
            "enable_memory": false,
            "enable_google_results": false,
            "input_text": message
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['detail'] != null) {
        throw HttpException(jsonResponse['detail']);
      }
      List<ChatModel> chatList = [];

      if (jsonResponse["message"] != null) {
        chatList = List.generate(1,
            (index) => ChatModel(msg: jsonResponse['message'], chatIndex: 1));
      }

      if (jsonResponse["image_urls"].length > 0) {
        chatList = List.generate(
            jsonResponse["image_urls"].length,
            (index) => ChatModel(
                msg: jsonResponse['image_urls'][index], chatIndex: 1));
      }
      return chatList;
    } catch (detail) {
      log("error $detail");
      rethrow;
    }
  }
}
