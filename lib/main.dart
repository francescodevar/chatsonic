import 'package:chatsonic/screens/chat_Screen.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          useMaterial3: true,
          appBarTheme: AppBarTheme(color: cardColor)),
      title: 'ChatSonic',
      home: const ChatScreen(),
    );
  }
}
