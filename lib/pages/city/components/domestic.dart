import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/model/city/area.dart';
import 'package:flutter_breathe/model/city/city_pinying.dart';
import 'package:flutter_breathe/model/city/location.dart';
import 'package:flutter_breathe/common/store/location_store.dart';
import 'package:flutter_breathe/service/storage_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Domestic extends GetView<DomesticController> {
  const Domestic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DomesticController());
    return Obx(() => controller.isInit.value
        ? cityList()
        : const Center(child: CircularProgressIndicator(),));
  }

  Widget cityList() {
    return Stack(
      children: [
        //主体滚动内容
        Obx(
          () => ScrollablePositionedList.builder(
            itemScrollController: controller.itemScrollController,
            itemPositionsListener: controller.itemPositionsListener,
            itemCount: controller.letterCount.value,
            itemBuilder: (BuildContext context, int index) {
              //获取字母列表
              String key = controller.letterList[index];
              //获取字母对应列表
              List<Location> cityList =
                  key == "定位" ? [] : controller.cityMap[key]!.toList();
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index != 0
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [currentCity(), location()],
                          ),
                    index == 0
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.w),
                            child: Text(
                              key,
                              style: TextStyle(fontSize: 30.w),
                            ),
                          ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return titleItem(cityList[index]);
                      },
                      itemCount: cityList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        //右边Nav
        Obx(
          () => Positioned(
              top: 130.w,
              bottom: 100.w,
              right: 0,
              width: 60.w,
              child: Container(
                color: controller.navBackground.value,
                child: LayoutBuilder(builder: (context, constraints) {
                  controller.letterHeight = constraints.maxHeight;

                  return GestureDetector(
                    onVerticalDragDown: (details) {
                      //点击变色
                      controller.navBackground.value = Colors.black12;
                      int clickIndex = (details.localPosition.dy ~/
                              (constraints.maxHeight /
                                  controller.letterCount.value))
                          .clamp(0, controller.letterCount.value - 1);
                      calculateLetters(clickIndex);
                      toLetter(clickIndex);
                    },
                    onVerticalDragEnd: (details) {
                      controller.navBackground.value = Colors.transparent;
                      controller.isHideLetter.value = true;
                    },
                    onVerticalDragCancel: () {
                      controller.navBackground.value = Colors.transparent;
                      controller.isHideLetter.value = true;
                    },
                    onVerticalDragUpdate: (details) {
                      int clickIndex = (details.localPosition.dy ~/
                              (constraints.maxHeight /
                                  controller.letterCount.value))
                          .clamp(0, controller.letterCount.value - 1);
                      calculateLetters(clickIndex);

                      toLetter(clickIndex);
                    },
                    child: Obx(
                      () => Column(
                        children: letterNav(),
                      ),
                    ),
                  );
                }),
              )),
        ),
        Obx(
          () => Offstage(
            offstage: controller.isHideLetter.value,
            child: Center(
              child: Container(
                width: 1.sw / 3,
                height: 1.sw / 3,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
                child: Center(
                  child: Text(
                    controller.currentLetter.value,
                    style: TextStyle(fontSize: 50.w),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  //点击或移动到字母
  void toLetter(int clickIndex) {
    controller.itemScrollController.scrollTo(
        index: clickIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.linear);
  }

  //计算当前字母
  void calculateLetters(int clickIndex) {
    //中间方块
    controller.isHideLetter.value = false;

    //中间方块内容
    controller.currentLetter.value = controller.letterList[clickIndex];
  }

  List<Widget> letterNav() {
    return controller.letterList
        .map((item) => Expanded(child: Text(item)))
        .toList();
  }

  //列表项
  Widget titleItem(Location location) {
    return InkWell(
      onTap: () => controller.onChangerCity(location),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: Text(
              location.city,
              style: TextStyle(fontSize: 36.w, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  //选择城市
  Widget currentCity() {
    var locationService = Get.find<LocationStore>();
    return Obx(
      () => ExpansionPanelList(
        elevation: 1,
        children: <ExpansionPanel>[
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              //print(controller.selectCity.value);
              return Row(children: [
                Text.rich(TextSpan(
                    style:
                        TextStyle(fontSize: 36.w, fontWeight: FontWeight.bold),
                    children: [
                      const TextSpan(text: "您正在看: "),
                      TextSpan(text: locationService.city.value)
                    ])),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.locationList[0].county == '' ? "选择区县" : "切换区县",
                    style: TextStyle(fontSize: 26.w, color: Colors.grey),
                  ),
                ))
              ]);
            },
            body: Padding(
              padding: EdgeInsets.only(right: 50.w, bottom: 20.w),
              child: Wrap(
                spacing: 12,
                runSpacing: 13,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.end,
                children: currentDistrict(
                    controller.locationList[0], controller.pinyingList),
              ),
            ),
            isExpanded: controller.isExpanded.value,
            canTapOnHeader: true,
          ),
        ],
        expansionCallback: (panelIndex, isExpanded) {
          controller.isExpanded.value = !controller.isExpanded.value;
        },
        animationDuration: const Duration(milliseconds: 1),
      ),
    );
  }

  //定位
  Widget location() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "当前定位:",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 38.w,
                fontWeight: FontWeight.w500),
          ),
          Wrap(
            children: [
              ButtonItem(
                location: const Location(area: '北京市', city: '北京', county: ''),
                text: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "定位失败,点击重试",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 34.w,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.replay,
                      color: Colors.blue,
                    )
                  ],
                ),
              )
            ],
            spacing: 12,
            runSpacing: 13,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.end,
          ),
          Text(
            "热门城市:",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 38.w,
                fontWeight: FontWeight.w500),
          ),
          Wrap(
            children: generateList(),
            spacing: 12,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.end,
          ),
        ],
      ),
    );
  }
}

//计算当前城市
List<Widget> currentDistrict(Location location, List<CityPinying> allCity) {
  var controller = Get.find<DomesticController>();
  CityPinying getCityPinying =
      allCity.firstWhere((element) => element.name == location.city);
  City getDistrictList = controller.cityToCounty
      .firstWhere((element) => element.label == getCityPinying.location.city);
  var areaName = getDistrictList.county.toList().map((e) => e.label);
  return areaName
      .map((item) => ButtonItem(
          location:
              Location(area: location.area, city: location.city, county: item),
          text: Text(
            item,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 36.w,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          )))
      .toList();
}

//方框按钮
class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.text,
    required this.location,
  }) : super(key: key);

  final Widget text;
  final Location location;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DomesticController>();
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        child: text,
      ),
      onPressed: () => controller.onChangerCity(location),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
        elevation: MaterialStateProperty.all<double>(3.w),
      ),
    );
  }
}

List<Widget> generateList() {
  return hotCity
      .map((item) => ButtonItem(
          location: item,
          text: Text(
            item.city,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 36.w,
                fontWeight: FontWeight.w500),
          )))
      .toList();
}

List<Location> hotCity = const [
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
  Location(area: '北京市', city: '北京', county: ''),
];

class DomesticController extends GetxController {
  var selectCity = "".obs;
  //显示与隐藏中间字母
  var isHideLetter = true.obs;

  //当前移动到的字母
  var currentLetter = "".obs;

  //字母Nav总高度
  var letterHeight = 0.0;

  //每个字母高度
  var letterItemHeight = 0.0;

  ///Nav背景颜色
  var navBackground = Colors.transparent.obs;

  ///城市总数
  var cityListLength = 0.obs;

  ///存储排序后的
  List<CityPinying> pinyingList = [];

  ///字母列表
  List letterList = [].obs;

  //字母总数
  var letterCount = 0.obs;

  var isInit = false.obs;

  //存储城市带地区列表
  List<City> cityToCounty = [];

  ///分类
  Map<String, List<Location>> cityMap = <String, List<Location>>{};

  List<Map<String, dynamic>> locationListMap = [];
  List<Location> locationList = [];

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  ///读取城市信息
  var isExpanded = false.obs;

  Future<String> _loadAssets() async {
    return rootBundle.loadString('assets/data/citys.json');
  }

  void mapToList() {
    for (var element in locationListMap) {
      locationList.add(Location(
          area: element['area'],
          city: element['city'],
          county: element['county']));
    }
  }

  ///城市排序分组
  Future loadData() async {
    String jsonString = await _loadAssets();
    final jsonResponse = json.decode(jsonString);

    List<Area> responses = getAreaList(jsonResponse);

    responses.forEach((item) {
      item.city.forEach((city) {
        cityToCounty.add(city);
        cityListLength.value++;

        //处理拼音
        String cityName = city.label;
        String pinYin = PinyinHelper.getPinyin(cityName,
            separator: "", format: PinyinFormat.WITHOUT_TONE);
        pinyingList.add(CityPinying(
            pinying: pinYin,
            name: cityName,
            location:
                Location(area: item.label, city: city.label, county: '')));
      });
    });
    //排序
    pinyingList.sort((a, b) => a.pinying.compareTo(b.pinying));
    pinyingList.forEach((element) {
      String firstPinyin = element.pinying.substring(0, 1).toUpperCase();
      cityMap.putIfAbsent(firstPinyin, () => []).add(element.location);
    });
    //print(cityMap);
    letterList.addAll(cityMap.keys.toList());
    letterCount.value = letterList.length;
    //计算每个字母高度
    letterItemHeight = letterHeight / letterCount.value;
  }

  @override
  void onInit() {
    super.onInit();
    //初始化历史
    locationListMap = List.from(StorageService().getJSON("location") ?? []);
    mapToList();
    letterList.add("定位");

    loadData().then((_) => isInit.value = true);
  }

  var isArea = false.obs;

  //点击定位
  void onChangerCity(Location location) {
    LocationStore()
        .add(area: location.area, city: location.city, county: location.county);
    LocationStore().upadte();
    Get.back();
  }
}
