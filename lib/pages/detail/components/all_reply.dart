import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/posts_api.dart';
import 'package:flutter_breathe/model/comment/comment_model.dart';
import 'package:flutter_breathe/model/page/page_model.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/pages/detail/components/comment_box.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/widgets/keep_alive_wrapper.dart';
import 'package:flutter_breathe/widgets/loading_view.dart';
import 'package:flutter_breathe/widgets/status.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllReply extends GetView {
  final String pid;
  const AllReply({Key? key, required this.pid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AllReplyController());
    controller.pid = pid;
    return KeepAliveWrapper(
      child: LoadingView(
          future: controller.refreshMyComment(),
          doneWidget: Obx(() => EasyRefresh(
                emptyWidget: controller.myComment.isEmpty ? nullStatus() : null,
                header: LinkHeader(
                  controller.headerNotifier,
                  extent: 1.sh,
                  triggerDistance: 1.sh,
                  completeDuration: const Duration(milliseconds: 500),
                ),
                footer: ClassicalFooter(enableHapticFeedback: true),
                onRefresh: () async {
                  controller.refreshMyComment();
                },
                onLoad: () async {
                  controller.loadMyComment();
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return CommentBox(
                      commentModel: controller.myComment[index],
                    );
                  },
                  itemCount: controller.myComment.length,
                ),
              ))),
    );
  }
}

class AllReplyController extends GetxController {
  RxList<CommentModel> myComment = <CommentModel>[].obs;
  int myCurrent = 1;
  String pid = '';
  late LinkHeaderNotifier headerNotifier;

  //重新加载
  Future refreshMyComment() async {
    myComment.clear();
    myCurrent = 1;
    getComment(myCurrent);
  }

  //加载更多
  Future loadMyComment() async {
    myCurrent += 1;
    getComment(myCurrent);
  }

  getComment(int current) async {
    try {
      MyResponse myResponse = await PostsApi.getCommentByPid(pid, myCurrent);

      if (myResponse.success) {
        PageModel pageModel = PageModel.fromJson(myResponse.data);
        for (var item in pageModel.items) {
          myComment.add(CommentModel.fromJson(item));
          myComment.refresh();
        }
      } else {
        MyToast(myResponse.message);
      }
    } on DioError catch (e) {
      MyToast(e.message);
    } catch (e) {
      MyToast(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    headerNotifier = LinkHeaderNotifier();
  }
}


// pageModel page = pageModel.fromJson(myResponse["data"]);
//         for (var item in page.items) {
//           myComment.add(CommentModel.fromJson(item));
//         }