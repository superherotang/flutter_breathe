import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:get/get.dart';

class MoreText extends GetView<ExpandableController> {
  const MoreText({
    Key? key,
    required this.text,
    required this.maxLines,
  }) : super(key: key);
  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    Get.put(ExpandableController());
    TextSpan link = TextSpan(
        text: "... 更多",
        style: const TextStyle(
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            print("object");
          });

    Widget result = LayoutBuilder(
      builder: (context, constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final text = TextSpan(text: this.text);

        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: maxLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        //计算...size
        final linkSize = textPainter.size;
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        //计算总内容高宽
        final textSize = textPainter.size;
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: this.text.substring(0, endIndex),
            style: const TextStyle(
              color: AppColor.primaryText,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
              text: this.text,
              style: const TextStyle(color: AppColor.primaryText));
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}

class ExpandableController extends GetxController {}
