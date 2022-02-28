import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:get/get.dart';

class MoreText extends StatefulWidget {
  const MoreText(
    this.text, {
    Key? key,
    required this.maxLines,
    this.id,
  }) : super(key: key);
  final String text;
  final int maxLines;
  final int? id;

  @override
  State<MoreText> createState() => _MoreTextState();
}

class _MoreTextState extends State<MoreText> {
  bool readMore = true;
  @override
  Widget build(BuildContext context) {
    TextSpan link = TextSpan(
        text: readMore ? "... 更多" : "  收起",
        style: const TextStyle(
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            widget.id == null
                ? setState(() => readMore = !readMore)
                : Get.toNamed(Routes.DETAIL + widget.id.toString());
          });

    Widget result = LayoutBuilder(
      builder: (context, constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final text = TextSpan(text: widget.text);

        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: widget.maxLines,
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
        endIndex = textPainter.getOffsetBefore(pos.offset) == null
            ? 0
            : textPainter.getOffsetBefore(pos.offset)!;
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: widget.id == null
                ? (readMore ? widget.text.substring(0, endIndex) : widget.text)
                : widget.text.substring(0, endIndex),
            style: const TextStyle(
              color: AppColor.primaryText,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
              text: widget.text,
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







// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hubang/common/color.dart';
// import 'package:flutter_hubang/routes/app_routes.dart';
// import 'package:get/get.dart';

// class MoreText extends GetView<ExpandableController> {
//   const MoreText(
//     this.text, {
//     Key? key,
//     required this.maxLines,
//     this.id,
//   }) : super(key: key);
//   final String text;
//   final int maxLines;
//   final int? id;

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ExpandableController());
//     TextSpan link = TextSpan(
//         text: controller.readMore.value ? "... 更多" : "收起",
//         style: const TextStyle(
//           color: Colors.blue,
//         ),
//         recognizer: TapGestureRecognizer()
//           ..onTap = () {
//             id == null
//                 ? controller.readMore.value = !controller.readMore.value
//                 : Get.toNamed(Routes.DETAIL + id.toString());
//           });

//     Widget result = LayoutBuilder(
//       builder: (context, constraints) {
//         assert(constraints.hasBoundedWidth);
//         final double maxWidth = constraints.maxWidth;

//         final text = TextSpan(text: this.text);

//         TextPainter textPainter = TextPainter(
//           text: link,
//           textDirection: TextDirection.rtl,
//           maxLines: maxLines,
//           ellipsis: '...',
//         );
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         //计算...size
//         final linkSize = textPainter.size;
//         textPainter.text = text;
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         //计算总内容高宽
//         final textSize = textPainter.size;
//         int endIndex;
//         final pos = textPainter.getPositionForOffset(Offset(
//           textSize.width - linkSize.width,
//           textSize.height,
//         ));
//         endIndex = textPainter.getOffsetBefore(pos.offset) == null
//             ? 0
//             : textPainter.getOffsetBefore(pos.offset)!;
//         TextSpan textSpan;
//         if (textPainter.didExceedMaxLines) {
//           textSpan = TextSpan(
//             text: id == null
//                 ? (controller.readMore.value
//                     ? this.text.substring(0, endIndex)
//                     : this.text)
//                 : this.text.substring(0, endIndex),
//             style: const TextStyle(
//               color: AppColor.primaryText,
//             ),
//             children: <TextSpan>[link],
//           );
//         } else {
//           textSpan = TextSpan(
//               text: this.text,
//               style: const TextStyle(color: AppColor.primaryText));
//         }
//         return RichText(
//           softWrap: true,
//           overflow: TextOverflow.clip,
//           text: textSpan,
//         );
//       },
//     );
//     return result;
//   }
// }

// class ExpandableController extends GetxController {
//   var readMore = true.obs;
// }


