import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:friday/styles/app_colors.dart';
import 'package:friday/widgets/triangle_widget.dart';

import 'dart:math' as math;

import 'package:progress_indicators/progress_indicators.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.mainColor,
          child: Center(
            child: Image.asset(
              "assets/foxy.png",
              width: 12,
              height: 12,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(AppColors.mainColor),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*AnimatedTextKit(animatedTexts: [
                      TyperAnimatedText(message.toString().replaceAll("\n", ""),
                        textStyle: const TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16),)
                    ],
                      isRepeatingAnimation: false,
                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,),*/

                message.contains("{")
                    ? HighlightView(
                        // The original code to be highlighted
                        message.substring(message.indexOf("\n")),

                        // Specify language
                        // It is recommended to give it a value for performance
                        language: 'all',

                        // Specify highlight theme
                        // All available themes are listed in `themes` folder
                        theme: draculaTheme,

                        // Specify padding
                        padding: EdgeInsets.all(12),

                        // Specify text style
                        textStyle: const TextStyle(
                          fontFamily: 'My awesome monospace font',
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        message.toString().replaceAll("\n", ""),
                        // message.toString().substring(message.lastIndexOf("\n")),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 16),
                      ),
              ],
            ),
          ),
        ),
      ],
    ));

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 8, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          Visibility(
              visible: message == "Getting response...",
              child: Wrap(
                children: [
                  JumpingDotsProgressIndicator(
                    fontSize: 30.0,
                    color: AppColors.mainColor,
                  )
                ],
              )),
          Visibility(
              visible: message != "Getting response...",
              child: messageTextGroup),
        ],
      ),
    );
  }
}
