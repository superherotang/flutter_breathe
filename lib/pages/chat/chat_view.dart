import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/message_entity.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';

class ChatView extends GetView<ChatController> {
  
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALECTANG'),
        centerTitle: false,
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Divider(
            height: 0.5,
          ),
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // 判断列表内容是否大于展示区域
                bool overflow = false;
                double heightTmp = 0.0;
                for (MessageEntity entity in controller.msgList) {
                  heightTmp +=
                      _calculateMsgHeight(context, constraints, entity);
                  if (heightTmp > constraints.maxHeight) {
                    overflow = true;
                  }
                }
                return Obx(
                  () => EasyRefresh.custom(
                    scrollController: controller.scrollController,
                    reverse: true,
                    footer: CustomFooter(
                        enableInfiniteLoad: false,
                        extent: 40.0,
                        triggerDistance: 50.0,
                        footerBuilder: (context,
                            loadState,
                            pulledExtent,
                            loadTriggerPullDistance,
                            loadIndicatorExtent,
                            axisDirection,
                            float,
                            completeDuration,
                            enableInfiniteLoad,
                            success,
                            noMore) {
                          return Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  child: Container(),
                                  // child: SpinKitCircle(
                                  //   color: Colors.green,
                                  //   size: 30.0,
                                  // ),
                                ),
                              ),
                            ],
                          );
                        }),
                    slivers: <Widget>[
                      if (overflow)
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return _buildMsg(controller.msgList[index]);
                            },
                            childCount: controller.msgList.length,
                          ),
                        ),
                      if (!overflow)
                        SliverToBoxAdapter(
                          child: Container(
                            height: constraints.maxHeight,
                            width: double.infinity,
                            child: Column(
                              children: <Widget>[
                                for (MessageEntity entity
                                    in controller.msgList.reversed)
                                  _buildMsg(entity),
                              ],
                            ),
                          ),
                        ),
                    ],
                    onLoad: () async {
                      await Future.delayed(Duration(seconds: 2), () {
                        controller.msgList.addAll([
                          MessageEntity(true, "It's good!"),
                          MessageEntity(false, 'EasyRefresh'),
                        ]);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 10.0,
                bottom: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(
                          4.0,
                        )),
                      ),
                      child: TextField(
                        controller: controller.textEditingController,
                        decoration: null,
                        onSubmitted: (value) {
                          if (controller
                              .textEditingController.text.isNotEmpty) {
                            controller
                                .sendMsg(controller.textEditingController.text);
                            controller.textEditingController.text = '';
                          }
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.textEditingController.text.isNotEmpty) {
                        controller
                            .sendMsg(controller.textEditingController.text);
                        controller.textEditingController.text = '';
                      }
                    },
                    child: Container(
                      height: 30.0,
                      width: 60.0,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        left: 15.0,
                      ),
                      decoration: BoxDecoration(
                        color: controller.textEditingController.text.isEmpty
                            ? Colors.grey
                            : Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(
                          4.0,
                        )),
                      ),
                      child: const Text(
                        "发送",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建消息视图
  Widget _buildMsg(MessageEntity entity) {
    if (entity.own) {
      return Container(
        margin: EdgeInsets.all(
          10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "我",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(
                      4.0,
                    )),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 200.0,
                  ),
                  child: Text(
                    entity.msg,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
            Card(
              margin: EdgeInsets.only(
                left: 10.0,
              ),
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              elevation: 0.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                child: Image.asset('assets/images/default_avatar.png'),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(
          10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(
                right: 10.0,
              ),
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              elevation: 0.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                child: Image.asset('assets/images/default_avatar.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ALECTANG',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5.0,
                  ),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                      4.0,
                    )),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 200.0,
                  ),
                  child: Text(
                    entity.msg,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }

  // 计算内容的高度
  double _calculateMsgHeight(
      BuildContext context, BoxConstraints constraints, MessageEntity entity) {
    return 45.0 +
        _calculateTextHeight(
          context,
          constraints,
          text: '我',
          textStyle: const TextStyle(
            fontSize: 13.0,
          ),
        ) +
        _calculateTextHeight(
          context,
          constraints.copyWith(
            maxWidth: 200.0,
          ),
          text: entity.msg,
          textStyle: TextStyle(
            fontSize: 16.0,
          ),
        );
  }

  /// 计算Text的高度
  double _calculateTextHeight(
    BuildContext context,
    BoxConstraints constraints, {
    String text = '',
    required TextStyle textStyle,
    List<InlineSpan> children = const [],
  }) {
    final span = TextSpan(text: text, style: textStyle, children: children);

    final richTextWidget = Text.rich(span).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context);
    renderObject.layout(constraints);
    return renderObject.computeMinIntrinsicHeight(constraints.maxWidth);
  }
}
