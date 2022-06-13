import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtons extends StatefulWidget {
  const LikeButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<LikeButtons> createState() => _LikeButtonsState();
}

class _LikeButtonsState extends State<LikeButtons> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 40,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.thumb_up_alt_outlined,
          color: isLiked ? Colors.blue : Colors.grey,
          size: 30,
        );
      },
      likeCount: 78,
      countBuilder: (int? count, bool isLiked, String text) {
        var color = Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            'beğen',
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );
  }
}
