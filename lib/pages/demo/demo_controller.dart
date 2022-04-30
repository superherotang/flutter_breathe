import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DemoController extends GetxController {
  Socket socket = io(
      'ws://10.6.50.108:9090/?uid=21',
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
    socket.on('singleMsg', (data) {
      strList.add(data);
    });

    //When an event recieved from server, data is added to the stream
    // socket.on('msg', (data) => print(data));
  }

  List<String> strList = <String>[].obs;

  sendMsg() {
    socket.emit('singleMsg', "asd");
  }

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  @override
  void onClose() {
    super.onClose();
    socket.dispose();
  }
}
