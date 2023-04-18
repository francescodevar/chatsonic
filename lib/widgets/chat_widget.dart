import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatsonic/constants/constants.dart';
import 'package:chatsonic/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.chatIndex})
      : super(key: key);

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: chatIndex == 0 ? userColor : aiColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    chatIndex == 0
                        ? 'assets/flutter_logo.png'
                        : 'assets/cs logo.png',
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: msg.startsWith("https://")
                          ? Image.network(
                              msg,
                              width: 400,
                              height: 400,
                            )
                          : chatIndex == 0
                              ? TextWidget(
                                  label: msg,
                                )
                              : DefaultTextStyle(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  child: AnimatedTextKit(
                                    isRepeatingAnimation: false,
                                    repeatForever: false,
                                    displayFullTextOnTap: true,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        msg.trim(),
                                      )
                                    ],
                                  ),
                                )),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
// msg.startsWith("https://")
// 