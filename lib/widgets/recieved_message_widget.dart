import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:friday/styles/app_colors.dart';
import 'package:friday/widgets/triangle_widget.dart';

import 'dart:math' as math;

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key, required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    AnimatedTextKit(animatedTexts: [
                      TyperAnimatedText(message.toString(),
                       textStyle: const TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16),)
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,),
                    /*Text(
                      message.toString(),
                      style: const TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16),
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ));

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 18, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
