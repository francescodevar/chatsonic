// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

String API_url =
    "https://api.writesonic.com/v2/business/content/chatsonic?engine=premium";
Map<String, String> API_headers = {
//* paste your api-key
  'X-API-KEY': 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  'accept': 'application/json',
  'content-type': 'application/json',
};

//* Color info
Color backgroundColor = const Color(0xFF273656);
Color cardColor = const Color(0xff111827);
Color userColor = const Color(0x64273656);
Color aiColor = const Color(0xA60A1223);
