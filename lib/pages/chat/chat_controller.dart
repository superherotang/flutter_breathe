import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/message/message_info.dart';
import 'package:flutter_breathe/model/message_entity.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatController extends GetxController {
  late ScrollController scrollController;
  late TextEditingController textEditingController;

  List<MessageEntity> msgList = <MessageEntity>[].obs;
  var targetUid = Get.parameters['id'];

  int sourceUid = UserStore.to.userData!.uid;

  Socket socket = io(
      'ws://10.6.50.108:9090/?uid=' + UserStore.to.userData!.uid.toString(),
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          //.setExtraHeaders({'foo': 'bar'}) // optional
          .build());

  void connect() {
    //Socket socket = io('http://10.6.50.108:9090');
    socket.connect();

    socket.onConnect((_) {
      print('connect');
    });
    if (targetUid != "0") {
      socket.on('singleMsg', (data) {
        MessageInfo messageInfo = MessageInfo.fromJson(data);
        if (messageInfo.suid == UserStore.to.userData!.uid) {
          msgList.insert(0, MessageEntity(true, messageInfo.content));
        } else {
          msgList.insert(0, MessageEntity(false, messageInfo.content));
        }
      });
    } else {
      socket.on('roomMsg', (data) {
        MessageInfo messageInfo = MessageInfo.fromJson(data);
        if (messageInfo.suid == UserStore.to.userData!.uid) {
          msgList.insert(0, MessageEntity(true, messageInfo.content));
        } else {
          msgList.insert(0, MessageEntity(false, messageInfo.content));
        }
      });
    }

    //When an event recieved from server, data is added to the stream
    // socket.on('msg', (data) => print(data));
  }

  @override
  void onInit() {
    super.onInit();
    connect();
    scrollController = ScrollController();
    textEditingController = TextEditingController();
  }

  void sendMsg(String msg) {
    
    if (targetUid != "0") {
      msgList.insert(0, MessageEntity(true, msg));
      socket.emit(
          'singleMsg', MessageInfo(sourceUid, int.parse(targetUid!), msg, 1));
    } else {
      socket.emit(
          'roomMsg', MessageInfo(sourceUid, 0, msg, 1));
    }
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void onClose() {
    super.onClose();
    socket.dispose();
  }
}
