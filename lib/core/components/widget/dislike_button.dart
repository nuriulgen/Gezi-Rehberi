import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class DislikeButton extends StatefulWidget {
  const DislikeButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DislikeButton> createState() => _DislikeButtonState();
}

class _DislikeButtonState extends State<DislikeButton> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 40,
      circleColor: const CircleColor(start: Colors.red, end: Colors.red),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.red,
        dotSecondaryColor: Colors.red,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.thumb_down_alt_outlined,
          color: isLiked ? Colors.red : Colors.grey,
          size: 30,
        );
      },
      likeCount: 5,
      countBuilder: (int? count, bool isLiked, String text) {
        var color = Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            'beğenme',
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
